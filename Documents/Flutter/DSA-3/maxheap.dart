class Maxheap {
  List<int> heap = [];

  insert(List<int> arr) {
    for (var i = 0; i < arr.length; i++) {
      heap.add(arr[i]);
      heapfydown();
    }
  }

  heapfydown() {
    int currentindex = heap.length - 1;
    while (currentindex > 0) {
      int parentindex = (currentindex - 1) ~/ 2;
      if (heap[currentindex] > heap[parentindex]) {
        swap(currentindex, parentindex);
        currentindex = parentindex;
      } else {
        break;
      }
    }
  }

  swap(int currentindex, int parentindex) {
    int temp = heap[currentindex];
    heap[currentindex] = heap[parentindex];
    heap[parentindex] = temp;
  }

  remove() {
    int minval = heap.removeLast();
    heap[0] = minval;
    heapfyrem(0);
  }

  heapfyrem(int currentindex) {
    int minval = currentindex;
    int left = 2 * currentindex + 1;
    int right = 2 * currentindex + 2;
    if (left < heap.length && heap[left] > heap[minval]) {
      minval = left;
    }
    if (right < heap.length && heap[right] > heap[minval]) {
      minval = right;
    }
    if (currentindex != minval) {
      swap(currentindex, minval);
      heapfyrem(minval);
    }
  }

  List<int> heapsort() {
    List<int> sorted = [];

    while (heap.isNotEmpty) {
      sorted.insert(0, heap[0]);
      swap(0, heap.length - 1);
      heap.removeLast();
      heapfyrem(0);
    }

    return sorted;
  }
}

main() {
  Maxheap maxheap = Maxheap();
  List<int> arr = [10, 40, 30, 80, 50, 60];
  print(arr);
  maxheap.insert(arr);
  print(maxheap.heap);
  print('afteer removing element');
  maxheap.remove();
  print(maxheap.heap);
  print('after sorted');
  print(maxheap.heapsort());
}
// [10, 40, 30, 80, 50, 60]
// [80, 50, 60, 10, 40, 30]
// afteer removing element
// [60, 50, 30, 10, 40],
// after sorted
// [10, 30, 40, 50, 60]