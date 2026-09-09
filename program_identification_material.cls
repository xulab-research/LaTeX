\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{program_identification_material}[Program Identification Material]

% 不允许传递任何参数
\DeclareOption*{\ClassWarning{program_identification_material}{Option `\CurrentOption' is not allowed and will be ignored}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{article}

% 英文断行/连字：提供英文断字规则、直引号弯引号等排版细节
\RequirePackage[english]{babel}

% T1 编码：newtxtext 字体需要 T1 编码才能正确取字形（该设置不会被 newtxtext 自动引入，必须显式声明）
\RequirePackage[T1]{fontenc}

% 西文字体（Times 风格）
\RequirePackage[type1]{newtxtext}

% 补全完整粗体支持的 Consolas 风格等宽字体
\RequirePackage[scaled=0.95]{inconsolata}

% 数学符号集合
\RequirePackage{newtxmath}

% 公式粗体
\RequirePackage{bm}

% 微观排版优化（字符边缘微调、字距微伸缩），newtxtext 不会自带此功能
\RequirePackage{microtype}

% 页边距
\RequirePackage[top=2cm,bottom=2cm,left=2cm,right=2cm,headheight=15pt]{geometry}

% 设置正文行距，且保证 caption、表格和脚注等依然保持紧凑的单倍行距
\RequirePackage{setspace}
\setstretch{1.25}

% 更少的过宽/过窄行
\setlength{\emergencystretch}{2em}
\setlength{\parskip}{0pt}

% 不显示日期
\date{}

% 定义页眉和页脚所需要的包
\RequirePackage{fancyhdr}

% 代码与文件树
\RequirePackage{listings}
\lstdefinestyle{tree}{basicstyle=\ttfamily\small,commentstyle=\ttfamily\scriptsize,morecomment=[l]{\#},columns=fullflexible,keepspaces=true,breaklines=true,showstringspaces=false}

% 文档元数据
\newcommand{\Software}{待填写}
\newcommand{\Version}{V1.0}
\newcommand{\Owner}{待填写}

% 自定义页眉、页脚样式
\pagestyle{fancy}

% 清空页眉页脚
\fancyhf{}

% 页眉左侧设置软件名 + 版本号
\fancyhead[L]{\fontsize{10pt}{14pt}\selectfont\bfseries\Software\enspace\Version}

% 页眉右侧设置页码
\fancyhead[R]{\fontsize{10pt}{14pt}\selectfont\bfseries\thepage}

% 一些字符比如 "Δ" 使用 listings 无法进行正常编译，使用数学符号进行替换
\lstset{basicstyle=\ttfamily\fontsize{7}{8}\selectfont,columns=fullflexible,literate=
  {Δ}{{$\Delta$}}1
  {α}{{$\alpha$}}1
  {β}{{$\beta$}}1
  {γ}{{$\gamma$}}1
  {✓}{{$\checkmark$}}1
  {✗}{{$\times$}}1
  {○}{{$\circ$}}1
  {±}{{$\pm$}}1
  {└}{{+}}1
  {─}{{-}}1
  {⏸}{{||}}1
  {→}{{$\rightarrow$}}1
  {≥}{{$\ge$}}1 {≤}{{$\le$}}1
}
