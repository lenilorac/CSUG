#include "LCA2.cpp"
#include "LCA2_test.cpp"

int main(){

  Node * root = newNode(1);
  Node * n1 = newNode(2);
  Node * n2 = newNode(2);
  Node * n3 = newNode(4);
  Node * n5 = newNode(5);
  Node * n6 = newNode(6);
  Node * n7 = newNode(7);
  Node * n8 = newNode(8);
  root -> c = {n1,n2,n3,n4,n5};
  n1 -> p = {root};
  n1 -> c = {n3,n5,n6};
  n2 -> p = {root, n1};
  n2 -> c = {n4};
  n3 -> p = {root,n1};
  n3 -> c = {n5};
  n4 -> p = {root,n2};
  n4 -> c = {n7};
  n5 -> p = {root, n1,n3};
  n6 -> p = {n1};
  n6 -> c = {n8};
  n7 -> p = {n4};
  n8 -> p = {n6};
  

  cout << "LCA of a null graph " << findLCADAG(NULL, 0, 0);	
  cout << "LCA of a non-existent path = " << findLCADAG(root, -1, -1);
  cout << "LCA(1, 1) = " << findLCADAG(root, 1, 1);
  cout << "LCA(4, 5) = " << findLCADAG(root, 4, 5); 
  cout << "LCA(4, 6) = " << findLCADAG(root, 4, 6); 
  cout << "LCA(3, 4) = " << findLCADAG(root, 3, 4); 
  cout << "LCA(2, 4) = " << findLCADAG(root, 2, 4); 
  cout << "LCA(9, 5) = " << findLCADAG(root, 9, 5);
  cout << "LCA(7, 9) = " << findLCADAG(root, 7, 9); //non existant node;
  cout << "LCA(4, 8) = " << findLCADAG(root, 4, 8);

  return 0;

}
