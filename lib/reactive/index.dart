ReactiveEffect? currentEffect;

class ReactiveEffect<T> {
  T Function() fn;
  Function()? computed;
  Set<UseState> state = {};
  ReactiveEffect({
    required this.fn,
    this.computed,
  });

  notify() {
    computed != null ? computed!() : run();
  }

  T run() {
    state.clear();
    var prevEffect = currentEffect;
    currentEffect = this;
    try {
      return fn();
    } finally {
      currentEffect = prevEffect;
    }
  }

  dispose() {
    for (var s in state) {
      s.effects.remove(this);
    }
  }
}

class UseState<T> {
  T _value;
  Set<ReactiveEffect> effects = {};
  UseState(this._value);

  void set(T? Function(T) fn) {
    T? newValue = fn(_value);
    if (newValue != null) {
      _value = newValue;
    }
    notify();
  }

  T get() {
    if (currentEffect != null) {
      currentEffect!.state.add(this);
      effects.add(currentEffect!);
    }

    return _value;
  }

  notify() {
    for (var effect in effects) {
      effect.notify();
    }
  }

  T get value => get();

  set value(T v) {
    _value = v;
    notify();
  }
}
