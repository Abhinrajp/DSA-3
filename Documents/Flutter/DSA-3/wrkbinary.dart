// class Node {
//   int data;
//   Node? left, right;
//   Node(this.data);
// }

// class BSTWrk {
//   Node? root = null;

//   insert(int data) {
//     Node? newnode = Node(data);
//     if (root == null) {
//       root = newnode;
//       return;
//     }
//     Node? current = root;
//     while (true) {
//       if (data < current!.data) {
//         if (current.left == null) {
//           current.left = newnode;
//           return;
//         }
//         current = current.left;
//       } else {
//         if (current.right == null) {
//           current.right = newnode;
//           return;
//         }
//         current = current.right;
//       }
//     }
//   }

//   disino(Node? root) {
//     if (root != null) {
//       disino(root.left);
//       print(root.data);
//       disino(root.right);
//     }
//   }

//   dis() {
//     disino(root);
//   }

//   bool contan(int data) {
//     Node? current = root;
//     while (current != null) {
//       if (data < current.data) {
//         current = current.left;
//       } else if (data > current.data) {
//         current = current.right;
//       } else {
//         return true;
//       }
//     }
//     return false;
//   }

//   Node? dltnod(Node? root, int data) {
//     if (root == null) {
//       return null;
//     }
//     if (data < root.data) {
//       root.left = dltnod(root.left, data);
//     } else if (data > root.data) {
//       root.right = dltnod(root.right, data);
//     } else {
//       if (root.left == null) {
//         return root.right;
//       } else if (root.right == null) {
//         return root.left;
//       }
//       Node? minval = min(root.right!);
//       root.data = minval!.data;
//       root.right = dltnod(root.right, minval.data);
//     }
//     return root;
//   }

//   Node? min(Node node) {
//     while (node.left != null) {
//       node = node.left!;
//     }
//     return node;
//   }

//   dlt(int data) {
//     root = dltnod(root, data);
//   }

//   chk() {
//     List<int> arr = [];
//     for (var i = 1; i < arr.length; i++) {
//       if (arr[i] <= arr[i - 1]) {
//         return false;
//       }
//     }
//     return true;
//   }

//   chktree(Node? root, List<int> arr) {
//     if (root != null) {
//       chktree(root.left, arr);
//       arr.add(root.data);
//       chktree(root.right, arr);
//     }
//   }
// }

// main() {
//   BSTWrk bstWrk = BSTWrk();
//   bstWrk.insert(5);
//   bstWrk.insert(2);
//   bstWrk.insert(8);
//   bstWrk.insert(1);
//   bstWrk.insert(9);
//   bstWrk.insert(3);
//   bstWrk.insert(6);
//   bstWrk.dis();
//   print("the give number is ${bstWrk.contan(5)}");
//   print('after dlt a node');
//   bstWrk.dlt(5);
//   bstWrk.dis();
//   print("the given number is a binary tee ? : ${bstWrk.chk()}");
// }
class Node {
  int? data;
  Node? left, right;
  Node(this.data);
}

class Binarywrks {
  Node? root = null;
  insert(int data) {
    Node? newnode = Node(data);
    if (root == null) {
      root = newnode;
      return;
    }
    Node? current = root;
    while (true) {
      if (data < current!.data!) {
        if (current.left == null) {
          current.left = newnode;
          return;
        }
        current = current.left;
      } else {
        if (current.right == null) {
          current.right = newnode;
          return;
        }
        current = current.right;
      }
    }
  }

  dltnod(Node? root, int data) {
    if (data < root!.data!) {
      root.left = dltnod(root.left, data);
    } else if (data > root.data!) {
      root.right = dltnod(root.right, data);
    } else {
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }
      Node? minval = min(root.right!);
      root.data = minval!.data;
      root.right = dltnod(root.right, minval.data!);
    }

    return root;
  }

  Node? min(Node node) {
    while (node.left != null) {
      node = node.left!;
    }
    return node;
  }

  dlt(int data) {
    root = dltnod(root, data);
  }

  dis() {
    disino(root);
  }

  disino(Node? root) {
    if (root != null) {
      disino(root.left);
      print(root.data);
      disino(root.right);
    }
  }

  contai(int data) {
    Node? current = root;
    while (current != null) {
      if (data < current.data!) {
        current = current.left;
      } else if (data > current.data!) {
        current = current.right;
      } else {
        return true;
      }
    }
    return false;
  }

  chk() {
    List<int> arr = [];
    chking(root, arr);
    for (var i = 1; i < arr.length; i++) {
      if (arr[i] <= arr[i - 1]) {
        return false;
      }
    }
    return true;
  }

  chking(Node? root, List<int> arr) {
    if (root != null) {
      chking(root.left, arr);
      arr.add(root.data!);
      chking(root.right, arr);
    }
  }
}

main() {
  Binarywrks binarywrks = Binarywrks();
  binarywrks.insert(50);
  binarywrks.insert(10);
  binarywrks.insert(80);
  binarywrks.insert(90);
  binarywrks.insert(40);
  binarywrks.insert(60);
  binarywrks.dis();
  print('after dlt');
  binarywrks.dlt(40);
  binarywrks.dis();
  print(binarywrks.contai(40));
  print(binarywrks.chk());
}
