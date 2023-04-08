typedef Words = Map<String, String>;

class Dictionary {
  Words words = {};

  void add({required String term, required String definition}) {
    words[term] = definition;
  }

  String? get(String term) {
    return words[term];
  }

  bool delete(String term) {
    return words.remove(term) != null;
  }

  bool update(String term, String definition) {
    if (words.containsKey(term)) {
      words[term] = definition;
      return true;
    } else {
      return false;
    }
  }

  void showAll() {
    words.forEach((term, definition) {
      print('$term: $definition');
    });
  }

  int count() {
    return words.length;
  }

  void upsert(String term, String definition) {
    words[term] = definition;
  }

  bool exists(String term) {
    return words.containsKey(term);
  }

  void bulkAdd(List<Words> addWords) {
    addWords.forEach((addWord) {
      words[addWord['term']!] = addWord['definition']!;
    });
  }

  void bulkDelete(List<String> deleteWord) {
    deleteWord.forEach((deleteWord) {
      words.remove(deleteWord);
    });
  }
}

void main() {
  var dictionary = Dictionary();

  dictionary.add(term: 'kim', definition: 'yeon-su');
  dictionary.add(term: 'kim', definition: 'MG');

  dictionary.showAll();

  print(dictionary.get('kim'));

  dictionary.update('apple', 'not a fruit');

  dictionary.upsert('apple', 'a sweet fruit');

  print(dictionary.get('apple'));

  dictionary.delete('apple');

  print(dictionary.exists('banana')); //true

  dictionary.bulkAdd([
    {'term': 'grapes', 'definition': 'a fruit'},
    {'term': 'kiwi', 'definition': 'a fruit'},
  ]);

  dictionary.bulkDelete(['kiwi']);

  dictionary.showAll();
}
