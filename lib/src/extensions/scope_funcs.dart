bool? scopeFuncs;

extension ScopeFuncs<T extends Object> on T {
  R let<R>(R Function(T it) scopeFunc) {
    return scopeFunc(this);
  }

  T also(void Function(T self) scopeFunc) {
    scopeFunc(this);
    return this;
  }

  void run(Function(T it) scopeFunc) {
    scopeFunc(this);
  }
}
