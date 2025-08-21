# CS106B Quick Reference Guide

> **� For complete setup instructions, see [README.md](README.md)**

## ⚡ Quick Commands

### Project Creation
```bash
./cs106b.sh assignment assign3     # New assignment
./cs106b.sh exercise palindrome    # New exercise  
./cs106b.sh experiment test_idea   # New experiment
```

### Build & Run (Choose One Method)

**CMake (Recommended for assignments):**
```bash
./cs106b.sh cmake-build           # Build everything
./cs106b.sh cmake-assignments     # Build assignments only
./cs106b.sh cmake-run assign1     # Run executable
```

**Manual g++ (Good for single files):**
```bash
./cs106b.sh run src/experiments/test.cpp    # Build & run
./cs106b.sh build src/lectures/example.cpp  # Build only
```

**VS Code (GUI):**
- `Ctrl+Shift+B` → Build current file
- `F5` → Run/debug current file

## 📁 File Organization

| Type | Location | Example |
|------|----------|---------|
| Assignments | `src/assignments/assign1/` | Multi-file projects |
| Exercises | `src/exercises/` | Single practice files |
| Experiments | `src/experiments/` | Quick tests |
| Lectures | `src/lectures/` | Course examples |
| Headers | `include/` | Reusable `.h` files |

## 🎯 Assignment Workflow

1. **Create**: `./cs106b.sh assignment assign2`
2. **Edit**: Files in `src/assignments/assign2/`
3. **Build**: `./cs106b.sh cmake-assignments`
4. **Run**: `./cs106b.sh cmake-run assign2`
5. **Debug**: Set breakpoints, press `F5` in VS Code

## � CS106B Essentials

### Common Includes
```cpp
#include <iostream>     // cout, cin
#include <string>       // string class  
#include <vector>       // vector container
#include <fstream>      // file I/O
#include <algorithm>    // sort, find, etc.
using namespace std;
```

### Input Patterns
```cpp
// Get integer with prompt
int getInteger(const string& prompt) {
    int value;
    cout << prompt;
    cin >> value;
    return value;
}

// Read file line by line
ifstream file("data.txt");
string line;
while (getline(file, line)) {
    // process line
}
```

### Vector Iteration
```cpp
vector<string> items = {"a", "b", "c"};

// Method 1: Traditional for loop
for (size_t i = 0; i < items.size(); i++) {
    cout << items[i] << endl;
}

// Method 2: Range-based (preferred)
for (const string& item : items) {
    cout << item << endl;
}
```

## 🐛 Quick Fixes

| Error | Solution |
|-------|----------|
| "No such file" | Check paths, run from project root |
| "Undefined reference" | Include all `.cpp` files in build |
| Sign comparison warning | Use `size_t` for vector indices |
| Segmentation fault | Check array bounds, null pointers |

## � Quick Links

- [C++ Reference](https://en.cppreference.com/)
- [CS106B Course](https://web.stanford.edu/class/cs106b/)
- [Stanford C++ Library](https://web.stanford.edu/dept/cs_edu/resources/qt/)
