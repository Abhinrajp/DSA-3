class TRIEnode {
  Map<String, TRIEnode> charater = {};
  bool end = false;
}

class TRie {
  TRIEnode root = TRIEnode();
  insert(String word) {
    TRIEnode temp = root;
    for (var i = 0; i < word.length; i++) {
      String char = word[i];
      temp.charater.putIfAbsent(char, () => TRIEnode());
      temp = temp.charater[char]!;
    }
    temp.end = true;
  }

  search(String word) {
    TRIEnode temp = root;
    for (var char in word.split('')) {
      if (!temp.charater.containsKey(char)) {
        return false;
      }
      temp = temp.charater[char]!;
    }
    return temp.end;
  }

  prefix(String word) {
    List<String> result = [];
    TRIEnode temp = root;
    for (var char in word.split('')) {
      if (!temp.charater.containsKey(char)) {
        print('the word "${word}" is not in here');
        return result;
      }
      temp = temp.charater[char]!;
    }
    prefixhelper(temp, word, result);
    return result;
  }

  prefixhelper(TRIEnode node, String word, List<String> result) {
    if (node.end) {
      result.add(word);
    }
    for (var char in node.charater.keys) {
      prefixhelper(node.charater[char]!, word + char, result);
    }
  }
}

main() {
  TRie trie = TRie();
  trie.insert('apple');
  trie.insert('app');
  trie.insert('orange');
  trie.insert('bed');
  trie.insert('book');
  trie.insert('koob');
  print(trie.prefix('b'));
  print(trie.prefix('can'));
}
  // print(trie.search('appl'));
  // print(trie.search('bed'));
