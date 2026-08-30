\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zh_paper}[中文论文]

% 不允许向 zh_paper 传递任何参数
\DeclareOption*{%
  \ClassWarning{zh_paper}{Option `\CurrentOption' is not allowed and will be ignored}%
}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,fontset=none]{ctexart}

% 英文断行/连字：提供英文断字规则、直引号弯引号等排版细节
\RequirePackage[english]{babel}

% 设置字体
\setCJKmainfont{Noto Serif CJK SC}
\setCJKsansfont{Noto Sans CJK SC}
\setCJKmonofont{Consolas}
\setmainfont{TeX Gyre Termes}
\setsansfont{TeX Gyre Heros}
\setmonofont{Consolas}
\setmathfont{TeX Gyre Termes Math}

% 数学符号集合
\RequirePackage{unicode-math}


% 一级标题靠左
\ctexset{section={format+=\raggedright}}

% 页边距
\RequirePackage{geometry}
\geometry{top=1.5cm,bottom=1.5cm,left=2cm,right=2cm}

% 设置正文行距，且保证 caption、表格和脚注等依然保持紧凑的单倍行距
\RequirePackage{setspace}
\setstretch{1.25}

% 首行缩进
\setlength{\parindent}{2em}

% 第一段也缩进
\RequirePackage{indentfirst}

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
\captionsetup{font=footnotesize, labelfont=bf, labelsep=period}

% 提供 algorithm 浮动体环境
\RequirePackage{algorithm}

% 现代伪代码语法引擎
\RequirePackage{algpseudocodex}

% 输入/输出标签加粗
\algrenewcommand\algorithmicrequire{\textbf{Input:}}
\algrenewcommand\algorithmicensure{\textbf{Output:}}

% 代码与文件树
\RequirePackage{listings}
\lstdefinestyle{tree}{basicstyle=\ttfamily\small,commentstyle=\ttfamily\scriptsize,morecomment=[l]{\#},columns=fullflexible,keepspaces=true,breaklines=true,showstringspaces=false}

% 参考文献
\RequirePackage{csquotes}
\RequirePackage[style=numeric-comp,sorting=none,backend=biber]{biblatex}
\addbibresource{references.bib}

% 双标题页（正文 + SI，均含作者与单位）机制的必要依赖，而且需要放在 authblk 前
\RequirePackage{titling}
\RequirePackage{authblk}
\renewcommand{\Authfont}{\fontsize{12pt}{14pt}\selectfont\bfseries}
\renewcommand{\Affilfont}{\fontsize{10pt}{12pt}\selectfont\normalfont}

% 交叉引用与超链接
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,linkcolor=red,citecolor=blue,urlcolor=blue}

% 链接行末自动换行
\RequirePackage{xurl}

% ORCID（需在 hyperref 之后加载）
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

% SI 标题页：复位计数器、启用 S 前缀编号、开启独立参考文献分区(refsection)，并用 \papertitle 记录的标题生成 SI 标题，SI 标题页与正文标题页样式一致、且包含全部作者与单位信息
\newcommand{\makesititle}{%
  \newrefsection%
  \pagenumbering{arabic}%
  \setcounter{page}{1}%
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
  \renewcommand{\theHpage}{S\arabic{page}}%
  \title{Supplementary Information for \\ \papertitlestyle\@papertitle}%
  \date{}%
  \maketitle%
}
