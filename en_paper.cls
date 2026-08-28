\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{en_paper}[英文论文]

% 不允许向 en_paper 传递任何参数
\DeclareOption*{%
  \ClassWarning{en_paper}{Option `\CurrentOption' is not allowed and will be ignored}%
}
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{article}

% 英文断行/连字：提供英文断字规则、直引号弯引号等排版细节
\RequirePackage[english]{babel}

% T1 编码：newtxtext 字体需要 T1 编码才能正确取字形（该设置不会被 newtxtext 自动引入，必须显式声明）
\RequirePackage[T1]{fontenc}

% 正文西文字体（Times 风格）
\RequirePackage[type1]{newtxtext}

% 微观排版优化（字符边缘微调、字距微伸缩），newtxtext 不会自带此功能
\RequirePackage{microtype}

% 页边距
\RequirePackage{geometry}
\geometry{top=2cm,bottom=2cm,left=2cm,right=2cm}

% 行距
\linespread{1.25}

% 首行缩进
\setlength{\parindent}{2em}

% 更少的过宽/过窄行
\setlength{\emergencystretch}{2em}
\setlength{\parskip}{0pt}

% 不显示日期
\date{}

% 页码样式
\AtBeginDocument{\pagestyle{plain}}

% 表格自动适配列宽X列
\RequirePackage{tabularx}

% 三线表
\RequirePackage{booktabs}

% 单元格跨行
\RequirePackage{multirow}

% 插图
\RequirePackage{graphicx}

% 数学符号集合
\RequirePackage{newtxmath}

% 参考文献
\RequirePackage[numbers,sort&compress]{natbib}

% 分章独立参考文献
\RequirePackage{chapterbib}

% 代码与文件树
\RequirePackage{listings}
\lstdefinestyle{tree}{basicstyle=\ttfamily\small,columns=fullflexible,keepspaces=true,breaklines=true,showstringspaces=false}

% 双标题页（正文 + SI，均含作者与单位）机制的必要依赖，而且需要放在 authblk 前
\RequirePackage{titling}
\RequirePackage{authblk}
\renewcommand{\Authfont}{\fontsize{12pt}{14pt}\selectfont\bfseries}
\renewcommand{\Affilfont}{\fontsize{10pt}{12pt}\selectfont\normalfont}

% 交叉引用与超链接
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,linkcolor=red,citecolor=blue,urlcolor=blue}

% ORCID（需在 hyperref 之后加载）
\RequirePackage{orcidlink}

% 标题样式
\newcommand{\papertitlestyle}{\sffamily\bfseries\LARGE}

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

% SI 标题页：复位计数器、启用 S 前缀编号，并用 \papertitle 记录的标题生成 SI 标题，SI 标题页与正文标题页样式一致、且包含全部作者与单位信息
\newcommand{\makesititle}{%
  \pagenumbering{arabic}%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%
  \setcounter{equation}{0}%
  \renewcommand{\thesection}{S\arabic{section}}%
  \renewcommand{\thefigure}{S\arabic{figure}}%
  \renewcommand{\thetable}{S\arabic{table}}%
  \renewcommand{\theequation}{S\arabic{equation}}%
  \renewcommand{\theHsection}{S\arabic{section}}%
  \renewcommand{\theHfigure}{S\arabic{figure}}%
  \renewcommand{\theHtable}{S\arabic{table}}%
  \renewcommand{\theHequation}{S\arabic{equation}}%
  \title{Supplementary Information for \\ \papertitlestyle\@papertitle}%
  \date{}%
  \maketitle%
}
