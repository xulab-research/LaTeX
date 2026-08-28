\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zh_paper}[中文论文]

% 不允许向 zh_paper 传递任何参数
\DeclareOption*{%
  \ClassWarning{zh_paper}{Option `\CurrentOption' is not allowed and
  will be ignored}%
}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,fontset=none]{ctexart}

% 一级标题靠左
\ctexset{section={format+=\raggedright}}

% 页边距
\RequirePackage{geometry}
\geometry{top=2cm,bottom=2cm,left=2cm,right=2cm}

% 行距与首行缩进
\linespread{1.25}
\setlength{\parindent}{2em}

% 不显示日期
\date{}

% 页码样式
\AtBeginDocument{\pagestyle{plain}}

% 设置字体
\setCJKmainfont{Noto Serif CJK SC}
\setCJKsansfont{Noto Sans CJK SC}
\setCJKmonofont{Noto Sans Mono CJK SC}
\setmainfont{TeX Gyre Termes}
\setsansfont{TeX Gyre Heros}
\setmonofont{DejaVu Sans Mono}

% 表格自动适配列宽X列
\RequirePackage{tabularx}

% 三线表
\RequirePackage{booktabs}

% 单元格跨行
\RequirePackage{multirow}

% 插图
\RequirePackage{graphicx}

% 数学符号集合
\RequirePackage{amssymb}

% 参考文献
\RequirePackage[numbers,sort&compress]{natbib}

% 分章独立参考文献
\RequirePackage{chapterbib}

% 交叉引用与超链接
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,linkcolor=red,citecolor=blue,urlcolor=blue}

% 代码与文件树
\RequirePackage{listings}
\lstdefinestyle{tree}{basicstyle=\ttfamily\small,columns=fullflexible,keepspaces=true,breaklines=true,showstringspaces=false}

% 双标题页（正文 + SI，均含作者与单位）机制的必要依赖，而且需要放在 authblk 前
\RequirePackage{titling}
\RequirePackage{authblk}
\renewcommand{\Authfont}{\fontsize{12pt}{14pt}\selectfont\bfseries}
\renewcommand{\Affilfont}{\fontsize{10pt}{11pt}\selectfont\normalfont}

% ORCID
\RequirePackage{orcidlink}

% 标题样式
\newcommand{\papertitlestyle}{\sffamily\bfseries\zihao{2}}

% 定义论文标题
% 作用一：以 \papertitlestyle 样式生成正文标题页；
% 作用二：把标题文本记录到 \@papertitle，供 SI 标题页自动复用
\newcommand{\papertitle}[1]{%
  \title{\papertitlestyle #1}%
  \gdef\@papertitle{#1}%
}

% 代码/文件名等标识符：\code{...}
\newcommand{\code}[1]{\nolinkurl{#1}}

% 参考文献：正文与 SI 末尾各调用一次
\newcommand{\printpaperbibliography}{\bibliographystyle{plainnat}\bibliography{references}}

% SI 标题页：复位计数器、启用 S 前缀编号，并用 \papertitle 记录的标题生成 SI 标题，SI
% 标题页与正文标题页样式一致、且包含全部作者与单位信息
\newcommand{\makesititle}{%
  \pagenumbering{arabic}%
  \setcounter{section}{0}%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%
  \setcounter{equation}{0}%
  \renewcommand{\thesection}{S\arabic{section}}%
  \renewcommand{\thefigure}{S\arabic{figure}}%
  \renewcommand{\thetable}{S\arabic{table}}%
  \renewcommand{\theequation}{S\arabic{equation}}%
  \title{Supplementary Information for \\ \papertitlestyle\@papertitle}%
  \date{}%
  \maketitle%
}
