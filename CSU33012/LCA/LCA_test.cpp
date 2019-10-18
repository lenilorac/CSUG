#include "LCA_test.h"
#include "LCA.cpp"


int main(){
  // Let us create the Binary Tree shown in above diagram. 
  Node * root = newNode(1); 
  root->left = newNode(2); 
  root->right = newNode(3); 
  root->left->left = newNode(4); 
  root->left->right = newNode(5); 
  root->right->left = newNode(6); 
  root->right->right = newNode(7); 
  root->left->left->left = newNode(8);
  root->left->left->right = newNode(9);

  cout << "LCA of a null tree = " << findLCA(NULL, 0, 0);	
  cout << "LCA of a non-existent path = " << findLCA(root, -1, -1);
  cout << "LCA(1, 1) = " << findLCA(root, 1, 1);
  cout << "LCA(4, 5) = " << findLCA(root, 4, 5); 
  cout << "LCA(4, 6) = " << findLCA(root, 4, 6); 
  cout << "LCA(3, 4) = " << findLCA(root, 3, 4); 
  cout << "LCA(2, 4) = " << findLCA(root, 2, 4); 
  cout << "LCA(9, 5) = " << findLCA(root, 9, 5);
  cout << "LCA(7, 9) = " << findLCA(root, 7, 9);
  cout << "LCA(4, 8) = " << findLCA(root, 4, 8);

  return 0;
}
