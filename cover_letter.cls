\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cover_letter}[Cover Letter Template]

% 不允许传递任何参数
\DeclareOption*{%
  \ClassWarning{cover_letter}{Option `\CurrentOption' is not allowed and will be ignored}%
}
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{article}

% 英文断行/连字：提供英文断字规则、直引号弯引号等排版细节
\RequirePackage[english]{babel}

% T1 编码：newtxtext 字体需要 T1 编码才能正确取字形（该设置不会被 newtxtext 自动引入，必须显式声明）
\RequirePackage[T1]{fontenc}

% 西文正文字体（Times 风格）
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
\RequirePackage[a4paper,top=1cm,bottom=2cm,left=2cm,right=2cm]{geometry}

% 设置正文行距，且保证 caption、表格和脚注等依然保持紧凑的单倍行距
\RequirePackage{setspace}
\setstretch{1.25}

% 更少的过宽/过窄行
\setlength{\emergencystretch}{2em}
\setlength{\parskip}{0pt}

% 段落之间增加 14pt 的垂直距离
\setlength{\parskip}{14pt}

% 插图
\RequirePackage{graphicx}

% 交叉引用与超链接
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,linkcolor=red,citecolor=blue,urlcolor=blue}

% 不设置页眉页脚
\pagestyle{empty}

% 通讯作者信息
\newcommand{\senderName}{Yunxin Xu}
\newcommand{\senderTitle}{Associate Professor}
\newcommand{\senderDepartment}{Department of Applied Statistics}
\newcommand{\senderSchool}{School of Statistics and Mathematics}
\newcommand{\senderBuilding}{Innovation and Entrepreneurship Building}
\newcommand{\senderUniversity}{Zhongnan University of Economics and Law}
\newcommand{\senderAddress}{Wuhan 430073, China}
\newcommand{\senderEmail}{xyx@zuel.edu.cn}

% 页眉/落款统一使用的小字号，集中定义一次，避免多处重复硬编码
\newcommand{\letterheadfont}{\fontsize{10pt}{9pt}\selectfont}

% 初始化推荐审稿人信息容器，供后续逐条追加
\newcommand{\reviewers}{}

% 定义推荐审稿人命令：接收 5 个字段，并依次追加到 \reviewers 中
\newcommand{\SuggestedReviewer}[5]{\g@addto@macro\reviewers{\par\vspace{1.5em} #1\\ #2\\ #3\\ #4\\ #5\\}}

% 页眉
\AtBeginDocument{
  \setlength{\parindent}{0pt}
  \begin{minipage}[t]{5cm}
    \vspace{-0.2cm}
    \includegraphics[width=\linewidth]{logo.png}
  \end{minipage}
  \hfill
  \begin{minipage}[t]{5cm}
    \letterheadfont
    \textbf{\senderName} \\
    \senderTitle \\
    \senderDepartment \\
    \senderSchool \\
  \end{minipage}
  \hfill
  \begin{minipage}[t]{6.2cm}
    \letterheadfont
    \senderBuilding \\
    \senderUniversity \\
    \senderAddress \\
    Email: \href{mailto:\senderEmail}{\nolinkurl{\senderEmail}} \\
  \end{minipage}
  \rule{\linewidth}{2pt}
}

% 推荐审稿人
\AtEndDocument{
  \begin{flushright}
    \setlength{\parskip}{0pt}
    Sincerely yours,\\
    \includegraphics[width=3.5cm]{signature.jpg} \\
    \senderName \\
    \senderTitle \\
    \senderDepartment \\
    \senderSchool \\
    \senderUniversity \\
  \end{flushright}
  \clearpage
  \begingroup
  \setlength{\parskip}{0pt}
  Suggested reviewers: \\
  \reviewers
  \endgroup
}
