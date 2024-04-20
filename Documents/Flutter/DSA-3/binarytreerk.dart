class Node {
  int? data;
  Node? left, right;
  Node(this.data);
}

class BSTWRK {
  Node? root = null;

  void insert(int data) {
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

  void dlt(int data) {
    root = dltnode(root, data);
  }

  Node? dltnode(Node? root, int data) {
    if (root == null) {
      return root;
    }
    if (data < root.data!) {
      root.left = dltnode(root.left, data);
    } else if (data > root.data!) {
      root.right = dltnode(root.right, data);
    } else {
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }
      Node? minval = min(root);
      root.data = minval!.data;
      root.right = dltnode(root.right, minval.data!);
    }
    return root;
  }

  Node? min(Node node) {
    while (node.right != null) {
      node = node.right!;
    }
    return node;
  }

  void dis() {
    pre(root);
  }

  void pre(Node? root) {
    if (root != null) {
      print(root.data);
      pre(root.left);
      pre(root.right);
    }
  }

  void diso() {
    post(root);
  }

  void post(Node? root) {
    if (root != null) {
      post(root.left);
      post(root.right);
      print(root.data);
    }
  }

  void dist() {
    inor(root);
  }

  void inor(Node? root) {
    if (root != null) {
      inor(root.left);
      print(root.data);
      inor(root.right);
    }
  }

  bool contain(int data) {
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

  bool chck() {
    List<int> arr = [];
    torbt(root, arr);
    for (var i = 1; i < arr.length; i++) {
      if (arr[i] <= arr[i - 1]) {
        return false;
      }
    }
    return true;
  }

  List<int> torbt(Node? root, List<int> arr) {
    if (root != null) {
      torbt(root.left, arr);
      arr.add(root.data!);
      torbt(root.right, arr);
    }
    return arr;
  }
}

main() {
  BSTWRK bstwrk = BSTWRK();
  bstwrk.insert(10);
  bstwrk.insert(90);
  bstwrk.insert(50);
  bstwrk.insert(70);
  bstwrk.insert(30);
  bstwrk.insert(80);
  // bstwrk.dis();
  // print("the gie value is contain the lis ? ${bstwrk.contain(300)}");
  // bstwrk.dlt(10);
  // print('deleted a node ');
  // bstwrk.dis();
  // print('after post');
  // bstwrk.diso();
  print('after inorder');
  bstwrk.dist();
  print("is the tree is a BST ?${bstwrk.chck()}");
}
