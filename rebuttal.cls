\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rebuttal}[Rebuttal]

% 不允许传递任何参数
\DeclareOption*{\ClassWarning{rebuttal}{Option `\CurrentOption' is not allowed and will be ignored}}
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
\RequirePackage[top=2cm,bottom=2cm,left=2cm,right=2cm]{geometry}

% 设置正文行距，且保证 caption、表格和脚注等依然保持紧凑的单倍行距
\RequirePackage{setspace}
\setstretch{1.25}

% 首行缩进
\setlength{\parindent}{2em}

% 更少的过宽/过窄行
\setlength{\emergencystretch}{2em}
\setlength{\parskip}{0pt}

% 不显示日期
\date{}

% 页码样式
\AtBeginDocument{\pagestyle{plain}}

% 三线表
\RequirePackage{booktabs}

% 表格自动适配列宽 X 列
\RequirePackage{tabularx}

% 单元格纵向合并跨行
\RequirePackage{multirow}

% 单元格内多行文字
\RequirePackage{makecell}

% 表格底部注脚与注释规范排版
\RequirePackage{threeparttable}

% 跨页长表格
\RequirePackage{longtable}

% 宽表格横向旋转页面
\RequirePackage{lscape}

% 现代表格排版引擎，与经典表格并存，支持标准的 booktabs 线条
\RequirePackage{tabularray}
\UseTblrLibrary{booktabs}

% 表格行高
\renewcommand{\arraystretch}{1.2}

% 插图
\RequirePackage{graphicx}

% 图表标题样式：加粗编号 + 句点分隔（如 "Figure 1."）
\RequirePackage{caption}
\captionsetup{font=footnotesize,labelfont=bf,labelsep=period}

% 提供 algorithm 浮动体环境
\RequirePackage{algorithm}

% 现代伪代码语法引擎
\RequirePackage{algpseudocodex}

% 输入/输出标签加粗
\algrenewcommand\algorithmicrequire{\textbf{Input:}}
\algrenewcommand\algorithmicensure{\textbf{Output:}}

% 自定义颜色
\definecolor{AlgoGreen}{HTML}{008000}
\definecolor{AlgoDarkRed}{HTML}{8B0000}
\definecolor{AlgoBlue}{HTML}{0066CC}
\definecolor{CommentBlue}{HTML}{3D85C6}

% 自定义算法表格排版与高亮命令
\newcommand{\AlgoDef}[1]{\multicolumn{3}{@{}l@{}}{\textcolor{AlgoGreen}{\textbf{def}}\ #1} \\}
\newcommand{\AlgoComment}[1]{\multicolumn{3}{@{}l@{}}{\textcolor{AlgoDarkRed}{\texttt{\#}\ \textit{#1}}} \\}
\newcommand{\AlgoRow}[3]{#1: & #2 & #3 \\}
\newcommand{\AlgoCont}[2]{& #1 & #2 \\}
\newcommand{\AlgoLink}[2]{\hyperref[#1]{\textcolor{AlgoBlue}{\underline{#2}}}}
\newcommand{\AlgoReturn}{\textcolor{AlgoGreen}{\textbf{return}}}
\newcommand{\AlgoKeyword}[1]{\textcolor{AlgoGreen}{\textbf{#1}}}

% 代码与文件树
\RequirePackage{listings}
\lstdefinestyle{tree}{basicstyle=\ttfamily\small,commentstyle=\ttfamily\scriptsize,morecomment=[l]{\#},columns=fullflexible,keepspaces=true,breaklines=true,showstringspaces=false}

% 参考文献
\RequirePackage{csquotes}
\RequirePackage[style=numeric-comp,sorting=none,backend=biber]{biblatex}
\addbibresource{references.bib}

% 交叉引用与超链接
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,linkcolor=red,citecolor=blue,urlcolor=blue}

% 链接行末自动换行
\RequirePackage{xurl}

% 创建标题
\renewcommand{\maketitle}{{\centering\LARGE Rebuttal to the Reviewers of\par\vspace{0.5em}\sffamily\bfseries \@title\par}\vspace{5em}{\hypersetup{linkcolor=black}\tableofcontents}\clearpage}

% 目录点线、缩进及章节编号宽度
\renewcommand*{\l@section}{\@dottedtocline{1}{0em}{1.8em}}
\renewcommand*{\l@subsection}{\@dottedtocline{2}{2em}{2.8em}}

% 自动编号审稿人标题
\newcommand{\reviewer}{%
  \refstepcounter{section}%
  \section*{Reviewer \thesection}%
  \addcontentsline{toc}{section}{Reviewer \thesection}%
}

% 自动编号审稿意见标题
\newcommand{\reviewercomment}{%
  \refstepcounter{subsection}%
  \subsection*{Comment \thesubsection}%
  \addcontentsline{toc}{subsection}{Comment \thesubsection}%
}
