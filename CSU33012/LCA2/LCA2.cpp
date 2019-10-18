// C++ Program for Lowest Common Ancestor in a Binary Tree 
// A O(n) solution to find LCA of two given values n1 and n2 
#include "LCA2.h"
#include <algorithm>
#define SIZE 256


using namespace std; 


// Stores the path in a vector path[], returns true if path exists otherwise false 
int * findPath(Node *root, vector<int> &path, int k) 
{ 
	// base case 
	if (root == NULL) return false; 

	// Store this node in path vector. The node will be removed if 
	// not in path from root to k 
	path.push_back(root->key); 

	// See if the k is same as root's key 
	if (root->key == k) 
		return true; 

	// Check if k is found in left or right sub-tree 
	if ( (root->left && findPath(root->left, path, k)) || 
		(root->right && findPath(root->right, path, k)) ) 
		return true; 

	// If not present in subtree rooted with root, remove root from 
	// path[] and return false 
	path.pop_back(); 
	return false; 
} 

// Returns LCA if node n1, n2 are present in the given DAG, 
// otherwise return -1 
int findLCA(Node *root, Node n1, Node n2) 
{ 
	// to store paths to n1 and n2 from the root 
	vector<int> path1, path2; 

	// Find paths from root to n1 and root to n2. If either n1 or n2 
	// is not present, return -1 
	if ( !findPath(root, path1, n1) || !findPath(root, path2, n2)) 
		return -1; 


	int i; 
	for (i = 0; i < path1.size() && i < path2.size() ; i++) 
		if (path1[i] != path2[i]) 
			break; 
	return path1[i-1]; 
} 

//tried constructing a graph
int findLCADAG(Node* root, Node* n1, Node* n2){
  if (root == NULL) return -1;

  if (root -> key == n1 -> key || root -> key == n2 -> key) return root -> key;

  if (n1 -> key == n2 -> key) return n2 -> key;
  //checking basic requirements

  int path[SIZE] = {}; //creating an array that would store matching parent nodes, woudl break with a more complex graph?
  int c = 0;

  for (int i = 0; i < sizeof(n1->p) && n1->p[i] != NULL; i++){
    for (int j = 0; j < sizeof(n2 -> p) && n2->p[j] != NULL; j++){
      if (n1->p[i]->key == n2->p[j]->key){
        path[c] = n2 -> p[j]->key;
        c++;
        //storing all the matching parent keys, doesn't quite make sense, doesn't take in account all the paths?
      }
    }
  }

  if (path == {}) return -1;
  else return max_element(path, lca+sizeof(path));

}

int main() 
{ 
	return 0; 
} 

