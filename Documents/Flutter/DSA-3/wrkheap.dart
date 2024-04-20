class MaxheapWrk {
  List<int> heap = [];

  insert(List<int> arr) {
    for (var i = 0; i < arr.length; i++) {
      heap.add(arr[i]);
      heapfy();
    }
  }

  heapfy() {
    int current = heap.length - 1;
    while (current > 0) {
      int paarent = (current - 1) ~/ 2;
      if (heap[current] > heap[paarent]) {
        swap(current, paarent);
        current = paarent;
      } else {
        break;
      }
    }
  }

  swap(int current, int paarent) {
    int temp = heap[paarent];
    heap[paarent] = heap[current];
    heap[current] = temp;
  }

  remove() {
    int minval = heap.removeLast();
    heap[0] = minval;
    heaprem(0);
  }

  heaprem(int currentind) {
    int minval = currentind;
    int left = 2 * currentind + 1;
    int right = 2 * currentind + 2;
    if (left < heap.length && heap[left] > heap[minval]) {
      minval = left;
    }
    if (right < heap.length && heap[right] > heap[minval]) {
      minval = right;
    }
    if (currentind != minval) {
      swap(currentind, minval);
      heaprem(minval);
    }
  }

  addel(int data) {
    heap.add(data);
    heapfy();
  }

  List<int> heapsort() {
    List<int> sorted = [];
    while (heap.isNotEmpty) {
      sorted.insert(0, heap[0]);
      swap(0, heap.length - 1);
      heap.removeLast();
      heaprem(0);
    }
    return sorted;
  }
}

main() {
  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  MaxheapWrk maxheapWrk = MaxheapWrk();
  print(arr);
  maxheapWrk.insert(arr);
  print(maxheapWrk.heap);
  maxheapWrk.remove();
  print(maxheapWrk.heap);
  maxheapWrk.addel(20);
  maxheapWrk.addel(12);
  maxheapWrk.addel(35);
  print(maxheapWrk.heap);
  print('after sorting of');
  print(maxheapWrk.heapsort());
}
// [9, 7, 8, 4, 5, 3, 6, 1, 2]
// [9, 8, 6, 7, 2, 3, 5, 1, 4]

