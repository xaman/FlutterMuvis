abstract class Cache<T> {

  bool isEmpty();

  List<T> getAll();

  T getById(int id);

  void putAll(List<T> values);

  void put(T value);

  void clear();

}