//
//  1660.swift
//  Small Talks
//
//  Created by Joy Sarkar on 27/08/24.
//

import Foundation

/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
//class Solution1660 {
//public:
//    TreeNode* correctBinaryTree(TreeNode* root) {
//        vector<TreeNode*> p;
//            
//        TreeNode* faulty = nullptr;
//            
//        p.push_back(root);
//            
//            while(p.size()) {
//                vector<TreeNode*> c;
//                    
//                for(int i=0;i<p.size();i++) {
//                    if (p[i]->left != nullptr) {
//                        auto it = std::find(p.begin(), p.end(), p[i]->left);
//                        if (it == p.end()) {
//                            c.push_back(p[i]->left);
//                        } else {
//                            faulty = p[i];
//                        }
//                    }
//                    
//                    if (p[i]->right != nullptr) {
//                        auto it = std::find(p.begin(), p.end(), p[i]->right);
//                        if (it == p.end()) {
//                            c.push_back(p[i]->right);
//                        } else {
//                            faulty = p[i];
//                        }
//                    }
//                    cout<<"p: "<<p[i]->val<<endl;
//                    if (faulty != nullptr) {
//                        cout<<"faluty: "<<faulty->val<<endl;
//                        break;
//                    }
//                }
//                if (faulty != nullptr) {
//                    cout<<faulty->val;
//                        break;
//                }
//                p = c;
//            
//            }
//
//            fixBinaryTree(root, faulty);
//                return root;
//    }
//    
//    void fixBinaryTree(TreeNode* root, TreeNode* faulty) {
//        if (root == nullptr) { return; }
//        if (root->left == faulty) {
//            root->left = nullptr;
//            return;
//        }
//        
//        if (root->right == faulty) {
//            root->right = nullptr;
//            return;
//        }
//        
//        fixBinaryTree(root->left, faulty);
//            fixBinaryTree(root->right, faulty);
//    }
//};


// C++ solution
