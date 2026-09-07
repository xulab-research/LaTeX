\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{document_identification_material}[Document Identification Material]

% 不允许传递任何参数
\DeclareOption*{\ClassWarning{zh_paper}{Option `\CurrentOption' is not allowed and will be ignored}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,fontset=none]{ctexart}

% 英文断行/连字：提供英文断字规则、直引号弯引号等排版细节
\RequirePackage[english]{babel}

% 数学符号集合
\RequirePackage{unicode-math}

% 中文字体设置 (开启 AutoFakeSlant 避免缺失独立斜体文件警告)
\setCJKmainfont{Noto Serif CJK SC}[AutoFakeSlant]
\setCJKsansfont{Noto Sans CJK SC}[AutoFakeSlant]
\setCJKmonofont{Noto Sans Mono CJK SC}[AutoFakeSlant]

% 西文字体设置
\setmainfont{TeX Gyre Termes}
\setsansfont{TeX Gyre Heros}
\setmonofont{Consolas}[Scale=MatchLowercase]

% 数学字体设置
\setmathfont{TeX Gyre Termes Math}

% 优化中西文混排断行与字距弹性，消除 Underfull \hbox
\xeCJKsetup{CJKecglue=\hspace{0.25em plus 0.15em minus 0.05em}}

% 一级标题靠左
\ctexset{section={format+=\raggedright}}

% 页边距
\RequirePackage[top=2cm,bottom=2cm,left=2cm,right=2cm,headheight=15pt]{geometry}

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

% 定义页眉和页脚所需要的包
\RequirePackage{fancyhdr}

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

% 代码与文件树
\RequirePackage{listings}
\lstdefinestyle{tree}{basicstyle=\ttfamily\small,commentstyle=\ttfamily\scriptsize,morecomment=[l]{\#},columns=fullflexible,keepspaces=true,breaklines=true,showstringspaces=false}

% 交叉引用与超链接
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,linkcolor=red,citecolor=blue,urlcolor=blue}

% 链接行末自动换行
\RequirePackage{xurl}

% 标题样式
\newcommand{\papertitlestyle}{\sffamily\bfseries\zihao{2}}

% refcount 提供 \getrefnumber{label}，可以在不产生超链接副作用的情况下单独取出某个 \label 对应的编号文本（比如 "3" 或 "S3"）
\RequirePackage{refcount}

% xstring 提供 \IfBeginWith，用来判断上面取出的编号文本是不是以 S 开头
\RequirePackage{xstring}

% 统一交叉引用命令：\xref{label}，cleveref 会根据 label 实际绑定的计数器类型（section/figure/table/equation/algorithm）自动判断该用哪个类型
\RequirePackage[capitalize,nameinlink,noabbrev]{cleveref}
\crefname{figure}{Fig}{Figs}
\Crefname{figure}{Fig}{Figs}
\crefname{table}{Table}{Tables}
\Crefname{table}{Table}{Tables}
\crefname{equation}{Equation}{Equations}
\Crefname{equation}{Equation}{Equations}
\crefname{algorithm}{Algorithm}{Algorithms}
\Crefname{algorithm}{Algorithm}{Algorithms}
\crefname{section}{Section}{Sections}
\Crefname{section}{Section}{Sections}
\newcommand{\xref}[1]{\IfBeginWith{\getrefnumber{#1}}{S}{Supplementary~}{}\cref{#1}}

% 文档元数据
\newcommand{\DocumentSoftware}{待填写}
\newcommand{\DocumentVersion}{V1.0}
\newcommand{\DocumentTitle}{用户操作手册}
\newcommand{\DocumentAuthor}{待填写}
\newcommand{\DocumentOwner}{待填写}
\newcommand{\DocumentCreated}{待填写}
\newcommand{\DocumentUpdated}{待填写}

% 自定义页眉、页脚样式
\pagestyle{fancy}

% 清空页眉页脚
\fancyhf{}

% 页眉左侧设置软件名 + 版本号 + 标题名称
\fancyhead[L]{\fontsize{10pt}{14pt}\selectfont\bfseries\DocumentSoftware\enspace\DocumentVersion\quad\DocumentTitle}

% 页眉右侧设置页码
\fancyhead[R]{\fontsize{10pt}{14pt}\selectfont\bfseries\thepage}

% 封面
\renewcommand{\maketitle}{%
  \thispagestyle{empty}%
  \vspace*{4cm}%
  {\centering\bfseries\fontsize{24pt}{36pt}\selectfont\DocumentSoftware\enspace\DocumentVersion\par\DocumentTitle\par}%
  \vfill\noindent%
  \begin{tblr}{colspec={X[3,l] X[7,l]},hlines,vlines}%
    文档版本 & V1.0 \\
    文档状态 & 正式版 \\
    作\qquad 者 & \DocumentAuthor \\
    负\, 责\, 人 & \DocumentOwner \\
    创建日期 & \DocumentCreated \\
    更新日期 & \DocumentUpdated \\
  \end{tblr}%
  \clearpage%
}

% 修订历史
\NewDocumentEnvironment{RevisionHistory}{+b}{%
  \pagenumbering{Roman}%
  \section*{修订历史}%
  \noindent%
  \begin{tblr}{colspec={X[24,c] X[12,c] X[20,c] X[40,c]},hlines,vlines}
    \textbf{日期} & \textbf{版本} & \textbf{修改者} & \textbf{描述} \\
    #1
  \end{tblr}%
  \clearpage%
  \begingroup%
  \hypersetup{linkcolor=black}%
  \tableofcontents%
  \endgroup%
  \clearpage%
  \pagenumbering{arabic}%
  \setcounter{page}{1}%
}{}
