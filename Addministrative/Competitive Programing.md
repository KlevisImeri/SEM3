DSU
``` c++
void make_set(int v) {
    parent[v] = v;
    size[v] = 1;
}

int find_set(int v) {
    if (v == parent[v])
        return v;
    return parent[v] = find_set(parent[v]);
}

void union_sets(int a, int b) {
    a = find_set(a);
    b = find_set(b);
    if (a != b) {
        if (size[a] < size[b])
            swap(a, b);
        parent[b] = a;
        size[a] += size[b];
    }
}
```
MaxFlow-MinCut 
```cpp
int n;
vector<vector<int>> capacity;
vector<vector<int>> adj;

int bfs(int s, int t, vector<int>& parent) {
    fill(parent.begin(), parent.end(), -1);
    parent[s] = -2;
    queue<pair<int, int>> q;
    q.push({s, INF});
    
    while (!q.empty()) {
        int cur = q.front().first;
        int flow = q.front().second;
        q.pop();
        
        for (int next : adj[cur]) {
            if (parent[next] == -1 && capacity[cur][next]) {
                parent[next] = cur;
                int new_flow = min(flow, capacity[cur][next]);
                if (next == t)
                    return new_flow;
                q.push({next, new_flow});
            }
        }
    }

    return 0;
}

int maxflow(int s, int t) {
    int flow = 0;
    vector<int> parent(n);
    int new_flow;

    while (new_flow = bfs(s, t, parent)) {
        flow += new_flow;
        int cur = t;
        while (cur != s) {
            int prev = parent[cur];
            capacity[prev][cur] -= new_flow;
            capacity[cur][prev] += new_flow;
            cur = prev;
        }
    }
    
    return flow;
}
```
Bellman-Ford
```cpp
void solve()
{
    vector<int> d(n, INF);
    d[v] = 0;
    vector<int> p(n, -1);

    for (;;) {
        bool any = false;
        for (Edge e : edges)
            if (d[e.a] < INF)
                if (d[e.b] > d[e.a] + e.cost) {
                    d[e.b] = d[e.a] + e.cost;
                    p[e.b] = e.a;
                    any = true;
                }
        if (!any)
            break;
    }

    if (d[t] == INF)
        cout << "No path from " << v << " to " << t << ".";
    else {
        vector<int> path;
        for (int cur = t; cur != -1; cur = p[cur])
            path.push_back(cur);
        reverse(path.begin(), path.end());

        cout << "Path from " << v << " to " << t << ": ";
        for (int u : path)
            cout << u << ' ';
    }
}
```
Prim's algorithm
``` cpp
int n;
vector<vector<int>> adj; // adjacency matrix of graph
const int INF = 1000000000; // weight INF means there is no edge

struct Edge {
    int w = INF, to = -1;
};

void prim() {
    int total_weight = 0;
    vector<bool> selected(n, false);
    vector<Edge> min_e(n);
    min_e[0].w = 0;
    
    for (int i=0; i<n; ++i) {
        int v = -1;
        for (int j = 0; j < n; ++j) {
            if (!selected[j] && (v == -1 || min_e[j].w < min_e[v].w))
                v = j;
        }
        
        if (min_e[v].w == INF) {
            cout << "No MST!" << endl;
            exit(0);
        }
        
        selected[v] = true;
        total_weight += min_e[v].w;
        if (min_e[v].to != -1)
            cout << v << " " << min_e[v].to << endl;
            
        for (int to = 0; to < n; ++to) {
            if (adj[v][to] < min_e[to].w)
                min_e[to] = {adj[v][to], v};
        }
    }
    
    cout << total_weight << endl;
}
```
My code s.ps1
```powershell
# Read input
$name = Read-Host "Name: "

# Create folder and cd
Remove-Item -Path $name -Recurse -Force
New-Item -Path $name -ItemType Directory
Set-Location -Path $name

# Create input file
New-Item -Path "input.txt" -ItemType File
New-Item -Path "output.txt" -ItemType File

# Create running script (r.ps1)
@"
@echo off
g++ -std=c++17 -O2 -Wall main.cpp 2> output.txt
type input.txt | a.exe >> output.txt
"@ | Set-Content -Path "r.bat"

# @"
# g++ -std=c++17 -O2 -Wall main.cpp 2>> output.txt
# Get-Content -Path input.txt | ./a.exe | Out-File -Encoding UTF16 -FilePath output.txt
# "@ | Set-Content -Path "r.ps1"

# Create main.cpp
@"
#include <bits/stdc++.h>
using namespace std;

typedef long long ll;
typedef long l;
typedef vector<int> vi;
typedef vector<vector<int>> vvi;
typedef vector<l> vl;
typedef vector<vector<l>> vvl;
typedef vector<ll> vll;
typedef vector<vector<ll>> vvll;
#define all(v) v.begin(), v.end()
#define printv(v) for(int i=0;i<(int)v.size();i++){cout<<v[i]<<' ';}cout<<endl;
#define printvv(v) for(int i=0;i<(int)v.size();i++){for(int j=0;j<(int)v[i].size();j++){cout<<v[i][j]<<' ';}cout<<endl;}cout<<endl;
template <int N>
using vvin = vector<array<int, N>>;


void solve(){

}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);

    int t; cin>>t;
    while(t--) solve();

    return 0;
}

/*      Description:
 *
 */
"@ | Set-Content -Path "main.cpp"

# Create Vim startup script (v.ps1)
@"
nvim -O main.cpp output.txt -c "wincmd l" -c "split input.txt" -c "wincmd h" -c ":7"
"@ | Set-Content -Path "v.ps1"

# Open Vim and files
& ".\v.ps1"
```
s.sh
```bash
#!/bin/bash

# Read input
echo "Name: "
read name

# Create folder and cd
rm -f -r "${name}"
mkdir "${name}"
cd "${name}"

# Create input file
touch input.txt

# Create running script (r.sh)
touch r.sh
echo "rm output.txt" >> r.sh
echo "touch output.txt" >> r.sh
echo "g++ -std=c++17 -O2 -Wall main.cpp &>> output.txt" >> r.sh
echo "./a.out < input.txt &>> output.txt" >> r.sh

# Create main.cpp
touch main.cpp
cat <<EOF > main.cpp
#include <bits/stdc++.h>
using namespace std;

typedef long long ll;
typedef long l;
typedef vector<int> vi;
typedef vector<vector<int>> vvi;
typedef vector<l> vl;
typedef vector<vector<l>> vvl;
typedef vector<ll> vll;
typedef vector<vector<ll>> vvll;
#define all(v) v.begin(), v.end()
#define printv(v) for(int i=0;i<(int)v.size();i++){cout<<v[i]<<' ';}cout<<endl;
#define printvv(v) for(int i=0;i<(int)v.size();i++){for(int j=0;j<(int)v[i].size();j++){cout<<v[i][j]<<' ';}cout<<endl;}cout<<endl;

void solve(){
    
}

signed main() {
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);
    int t; cin>>t;
    while(t--) solve();
    return 0;
}
EOF

# Create Vim startup script (v.sh)
touch v.sh
echo 'vim -O main.cpp output.txt -c "wincmd l" -c "split input.txt" -c "wincmd h" -c ":7"' > v.sh

# Open Vim and files
./v.sh
```
vim
```java
"------------------------------
" General settings
set number          " Show line numbers
set mouse=a         " Use mouse to scroll
set nowrap          " Disable line wrapping
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set ignorecase      " Ignore case when searching
set smartcase       " Override ignorecase if search contains uppercase
set laststatus=2    " Show status line always
set showcmd         " Show incomplete commands
set completeopt=menuone,preview " Better completion experience
set encoding=utf-8
set autoindent
set nocompatible
set autoread        " TO reload files immediately
"------------------------------

"------------------------------
" Indentation settings
set tabstop=4  	  " Tab width
set shiftwidth=4    " Indentation width
set expandtab       " Use spaces instead of tabs
set smarttab        " Insert tabs on blank lines according to shiftwidth
set wrap            " To wrap the text
"------------------------------

"------------------------------
" Plugins
call plug#begin()
" Just color shcemes
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/bluz71/vim-nightfly-colors'
"To use gc gcc for commenting code
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/preservim/tagbar'
"To show the cool bar at the bottom
Plug 'vim-airline/vim-airline'
" Add fzf.vim (Fuzzy Finder) plugin
Plug 'junegunn/fzf.vim'
" Add fzf (Fuzzy Finder) itself (required by fzf.vim)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" The file browser
Plug 'https://github.com/lambdalisue/fern.vim'
" The language parser
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
"------------------------------

"------------------------------
" Colors
set termguicolors
"colorscheme gruvbox
"set background=dark
colorscheme nightfly
"Daisable the main bg of theme
hi Normal guibg=NONE ctermbg=NONE   
"Disable the nubmer bgcolor of theme
hi LineNr guibg=NONE ctermbg=NONE  
"------------------------------

"-------------------------------
" Vimtex
let g:vimtex_view_method=''
" let g:vimtex_quickfix_mode=0
" set conceallevel=1
" let g:tex_conceal='abdmg'
" ------------------------------

"-------------------------------
" Fuzzy Finder
let g:fzf_vim = {}
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-s': 'vsplit' }
" let g:fzf_vim.preview_window = []
let g:fzf_vim.preview_window = ['right,100%']
" ------------------------------

"-------------------------------
" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
"------------------------------

"------------------------------
"Mappings"
imap <C-BS> <C-W>
nmap <F8> :TagbarToggle<CR>
" Map kj sequence to Escape key
inoremap jj <Esc>  
nnoremap <silent> \\ :wa<CR>:silent !.\r.bat<CR>
inoremap <silent> \\ :wa<CR>:silent !.\r.bat<CR>
"To move the selected up or down"
vnoremap <silent> J :m '>+1<CR>gv=gv"<CR> 
vnoremap <silent> K :m '<-2<CR>gv=gv"<CR>
"To move through the panes"
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
"Copy to clipboard
nnoremap <C-c> "+yy<CR>
vnoremap <C-c> "+y<CR>
"Fuzzy finder
nnoremap <C-P> :FZF<CR>
"To open vim explorer
inoremap <silent> <C-b> <ESC>:Fern . -drawer<CR>
nnoremap <silent> <C-b> <ESC>:Fern . -drawer<CR>
"To open the terminal
nnoremap <silent> t :vs<CR>:term<CR>
"------------------------------
```