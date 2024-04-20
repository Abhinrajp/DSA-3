class Tnode {
  Map<String, Tnode> charater = {};
  bool end = false;
}

class TRYYY {
  Tnode root = Tnode();
  insert(String word) {
    Tnode temp = root;
    for (var i = 0; i < word.length; i++) {
      String char = word[i];
      temp.charater.putIfAbsent(char, () => Tnode());
      temp = temp.charater[char]!;
    }
    temp.end = true;
  }

  serach(String word) {
    Tnode temp = root;
    for (var char in word.split('')) {
      if (!temp.charater.containsKey(char)) {
        return false;
      }
      temp = temp.charater[char]!;
    }
    return temp.end;
  }

  prefix(String word) {
    List<String> reslt = [];
    Tnode temp = root;
    for (var char in word.split('')) {
      if (!temp.charater.containsKey(char)) {
        print("the word ${word} is not here");
        return reslt;
      }
      temp = temp.charater[char]!;
    }
    prefixhelper(temp, word, reslt);
    return reslt;
  }

  prefixhelper(Tnode node, String word, List<String> result) {
    if (node.end) {
      result.add(word);
    }
    for (var char in node.charater.keys) {
      prefixhelper(node.charater[char]!, word + char, result);
    }
  }
}

main() {
  TRYYY tryyy = TRYYY();
  tryyy.insert('word');
  tryyy.insert('aple');
  tryyy.insert('app');
  tryyy.insert('apple');
  tryyy.insert('white');
  tryyy.insert('orange');
  print(tryyy.serach('app'));
  print(tryyy.prefix('apl'));
}
