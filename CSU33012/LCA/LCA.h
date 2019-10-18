#pragma once
#include <iostream> 
#include <vector> 

using namespace std;

// A Binary Tree node 
struct Node 
{ 
	int key; 
	struct Node *left, *right; 
}; 

// Utility function creates a new binary tree node with given key 
Node * newNode(int k) 
{
	Node *temp = new Node; 
	temp->key = k; 
	temp->left = temp->right = NULL; 
	return temp; 
}; 


bool findPath(Node *root, vector<int> &path, int k);

int findLCA(Node *root, int n1, int n2);

