import 'dart:async' show Future, Stream, StreamSubscription;
import 'hash_codes.dart' show hashValues;

import 'package:meta/meta.dart';
import 'package:react/react.dart';

typedef AsyncComponentRenderer<T> = dynamic Function(AsyncSnapshot<T> snapshot);

/// A Flutter like StreamBuilder
class StreamBuilder<T> extends Component {

  /// The asynchronous computation to which this builder is currently connected,
  /// possibly null. When changed, the current summary is updated using
  /// [afterDisconnected], if the previous stream was not null, followed by
  /// [afterConnected], if the new stream is not null.
  final Stream<T> stream;

  /// The build strategy currently used by this builder. Cannot be null.
  final AsyncComponentRenderer<T> builder;

  final T initialData;

  StreamSubscription<T> _subscription;

  AsyncSnapshot<T> _summary;

  StreamBuilder({
    this.initialData,
    this.stream,
    @required this.builder
  }) : assert(builder != null);

  /// Returns the initial summary of stream interaction, typically representing
  /// the fact that no interaction has happened at all.
  ///
  /// Sub-classes must override this method to provide the initial value for
  /// the fold computation.
  AsyncSnapshot<T> initial() => AsyncSnapshot<T>.withData(ConnectionState.none, initialData);


  /// Returns an updated version of the [current] summary reflecting that we
  /// are now connected to a stream.
  ///
  /// The default implementation returns [current] as is.
  AsyncSnapshot<T> afterConnected(AsyncSnapshot<T> current) => current.inState(ConnectionState.waiting);

  /// Returns an updated version of the [current] summary following a data event.
  ///
  /// Sub-classes must override this method to specify how the current summary
  /// is combined with the new data item in the fold computation.
  AsyncSnapshot<T> afterData(AsyncSnapshot<T> current, T data) {
    return AsyncSnapshot<T>.withData(ConnectionState.active, data);
  }

  /// Returns an updated version of the [current] summary following an error.
  ///
  /// The default implementation returns [current] as is.
  AsyncSnapshot<T> afterError(AsyncSnapshot<T> current, Object error) {
    return AsyncSnapshot<T>.withError(ConnectionState.active, error);
  }

  /// Returns an updated version of the [current] summary following stream
  /// termination.
  ///
  /// The default implementation returns [current] as is.
  AsyncSnapshot<T> afterDone(AsyncSnapshot<T> current) => current.inState(ConnectionState.done);

  /// Returns an updated version of the [current] summary reflecting that we
  /// are no longer connected to a stream.
  ///
  /// The default implementation returns [current] as is.
  AsyncSnapshot<T> afterDisconnected(AsyncSnapshot<T> current) => current.inState(ConnectionState.none);

  /// Returns a Widget based on the [currentSummary].
  dynamic renderSnapshot(AsyncSnapshot<T> currentSummary) => this.builder(currentSummary);

  @override
  void componentWillMount() {
    super.componentWillMount();
    _summary = this.initial();
    _subscribe();
  }

  @override
  void componentWillUnmount() {
    _unsubscribe();
    super.componentWillUnmount();
  }

  @override
  dynamic render() => this.renderSnapshot(_summary);

  void _subscribe() {
    if (this.stream != null) {
      _subscription = this.stream.listen((T data) {
        setState(() {
          _summary = this.afterData(_summary, data);
        });
      }, onError: (Object error) {
        setState(() {
          _summary = this.afterError(_summary, error);
        });
      }, onDone: () {
        setState(() {
          _summary = this.afterDone(_summary);
        });
      });
      _summary = this.afterConnected(_summary);
    }
  }

  void _unsubscribe() {
    if (_subscription != null) {
      _subscription.cancel();
      _subscription = null;
    }
  }
}

/// The state of connection to an asynchronous computation.
///
/// See also:
///
/// * [AsyncSnapshot], which augments a connection state with information
/// received from the asynchronous computation.
enum ConnectionState {
  /// Not currently connected to any asynchronous computation.
  ///
  /// For example, a [FutureBuilder] whose [FutureBuilder.future] is null.
  none,

  /// Connected to an asynchronous computation and awaiting interaction.
  waiting,

  /// Connected to an active asynchronous computation.
  ///
  /// For example, a [Stream] that has returned at least one value, but is not
  /// yet done.
  active,

  /// Connected to a terminated asynchronous computation.
  done,
}

/// Immutable representation of the most recent interaction with an asynchronous
/// computation.
///
/// See also:
///
/// * [StreamBuilder], which builds itself based on a snapshot from interacting
///   with a [Stream].
/// * [FutureBuilder], which builds itself based on a snapshot from interacting
///   with a [Future].
@immutable
class AsyncSnapshot<T> {
  /// Creates an [AsyncSnapshot] with the specified [connectionState],
  /// and optionally either [data] or [error] (but not both).
  const AsyncSnapshot._(this.connectionState, this.data, this.error)
      : assert(connectionState != null),
        assert(!(data != null && error != null));

  /// Creates an [AsyncSnapshot] in [ConnectionState.none] with null data and error.
  const AsyncSnapshot.nothing() : this._(ConnectionState.none, null, null);

  /// Creates an [AsyncSnapshot] in the specified [state] and with the specified [data].
  const AsyncSnapshot.withData(ConnectionState state, T data) : this._(state, data, null);

  /// Creates an [AsyncSnapshot] in the specified [state] and with the specified [error].
  const AsyncSnapshot.withError(ConnectionState state, Object error) : this._(state, null, error);

  /// Current state of connection to the asynchronous computation.
  final ConnectionState connectionState;

  /// The latest data received by the asynchronous computation.
  ///
  /// If this is non-null, [hasData] will be true.
  ///
  /// If [error] is not null, this will be null. See [hasError].
  ///
  /// If the asynchronous computation has never returned a value, this may be
  /// set to an initial data value specified by the relevant widget. See
  /// [FutureBuilder.initialData] and [StreamBuilder.initialData].
  final T data;

  /// Returns latest data received, failing if there is no data.
  ///
  /// Throws [error], if [hasError]. Throws [StateError], if neither [hasData]
  /// nor [hasError].
  T get requireData {
    if (hasData)
      return data;
    if (hasError)
      throw error;
    throw StateError('Snapshot has neither data nor error');
  }

  /// The latest error object received by the asynchronous computation.
  ///
  /// If this is non-null, [hasError] will be true.
  ///
  /// If [data] is not null, this will be null.
  final Object error;

  /// Returns a snapshot like this one, but in the specified [state].
  ///
  /// The [data] and [error] fields persist unmodified, even if the new state is
  /// [ConnectionState.none].
  AsyncSnapshot<T> inState(ConnectionState state) => AsyncSnapshot<T>._(state, data, error);

  /// Returns whether this snapshot contains a non-null [data] value.
  ///
  /// This can be false even when the asynchronous computation has completed
  /// successfully, if the computation did not return a non-null value. For
  /// example, a [Future<void>] will complete with the null value even if it
  /// completes successfully.
  bool get hasData => data != null;

  /// Returns whether this snapshot contains a non-null [error] value.
  ///
  /// This is always true if the asynchronous computation's last result was
  /// failure.
  bool get hasError => error != null;

  @override
  String toString() => '$runtimeType($connectionState, $data, $error)';

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other))
      return true;
    if (other is! AsyncSnapshot<T>)
      return false;
    final AsyncSnapshot<T> typedOther = other;
    return connectionState == typedOther.connectionState
        && data == typedOther.data
        && error == typedOther.error;
  }

  @override
  int get hashCode => hashValues(connectionState, data, error);
}