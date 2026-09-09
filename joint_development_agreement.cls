\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{joint_development_agreement}[Joint Development Agreement]

% 不允许传递任何参数
\DeclareOption*{\ClassWarning{joint_development_agreement}{Option `\CurrentOption' is not allowed and will be ignored}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,fontset=none]{ctexart}

% 中文字体设置 (开启 AutoFakeSlant 避免缺失独立斜体文件警告)
\setCJKmainfont{Noto Serif CJK SC}[AutoFakeSlant]
\setCJKsansfont{Noto Sans CJK SC}[AutoFakeSlant]
\setCJKmonofont{Noto Sans Mono CJK SC}[AutoFakeSlant]

% 西文字体设置
\setmainfont{TeX Gyre Termes}
\setsansfont{TeX Gyre Heros}
\setmonofont{Consolas}[Scale=MatchLowercase]

% 添加支持带圈数字的字体
\RequirePackage{newunicodechar}
\newfontfamily{\circlednumberfont}{Noto Serif CJK SC}
\newunicodechar{①}{{\circlednumberfont ①}}
\newunicodechar{②}{{\circlednumberfont ②}}
\newunicodechar{③}{{\circlednumberfont ③}}
\newunicodechar{④}{{\circlednumberfont ④}}
\newunicodechar{⑤}{{\circlednumberfont ⑤}}
\newunicodechar{⑥}{{\circlednumberfont ⑥}}
\newunicodechar{⑦}{{\circlednumberfont ⑦}}
\newunicodechar{⑧}{{\circlednumberfont ⑧}}
\newunicodechar{⑨}{{\circlednumberfont ⑨}}
\newunicodechar{⑩}{{\circlednumberfont ⑩}}

% 章节标题格式、排版设置
\ctexset{section={format=\normalsize,name={第,条},number=\chinese{section},indent=2em,beforeskip=6pt,afterskip=6pt}}

% 页边距
\RequirePackage[top=2cm,bottom=2cm,left=2cm,right=2cm]{geometry}

% 设置正文行距，且保证 caption、表格和脚注等依然保持紧凑的单倍行距
\RequirePackage{setspace}
\setstretch{1.25}

% 首行缩进
\setlength{\parindent}{2em}

% 更少的过宽/过窄行
\setlength{\emergencystretch}{2em}
\setlength{\parskip}{6pt}

% 不显示日期
\date{}

% 页码样式
\AtBeginDocument{\pagestyle{empty}}

% 控制列表排版的宏包
\RequirePackage{enumitem}

% 设置有序列表格式
\setlist[enumerate]{label=\arabic*.,leftmargin=0pt,labelindent=2em,labelsep=0pt,itemindent=!,nosep}

% 合同中需要填写的内容统一加下划线
\NewDocumentCommand{\Field}{m}{\underline{\hspace{1em}#1\hspace{1em}}}

\ExplSyntaxOn

\tl_new:N  \g__agreement_software_tl
\seq_new:N \g__agreement_party_name_seq
\seq_new:N \g__agreement_party_id_seq
\seq_new:N \g__agreement_party_date_seq

% 用户接口：软件名称，以及任意数量的参与方。
\NewDocumentCommand{\Software}{m}
{ \tl_gset:Nn \g__agreement_software_tl {#1} }

\NewDocumentCommand{\AddParty}{m m m}
{
  \seq_gput_right:Nn \g__agreement_party_name_seq {#1}
  \seq_gput_right:Nn \g__agreement_party_id_seq   {#2}
  \seq_gput_right:Nn \g__agreement_party_date_seq {#3}
}

% 前十方沿用中文传统称谓；人数更多时自动使用“第11方”等称谓。
\cs_new:Npn \__agreement_party_label:n #1
{
  \int_case:nnF {#1}
  {
    {1}{甲方} {2}{乙方} {3}{丙方} {4}{丁方} {5}{戊方}
    {6}{己方} {7}{庚方} {8}{辛方} {9}{壬方} {10}{癸方}
  }
  {第\int_to_arabic:n{#1}方}
}

\cs_new:Npn \__agreement_software_field:
{ \Field{\tl_use:N \g__agreement_software_tl} }

\cs_new_protected:Npn \__agreement_print_party_list:
{
  \int_step_inline:nn {\seq_count:N \g__agreement_party_name_seq}
  {
    \par\noindent\hspace*{\parindent}
    \__agreement_party_label:n{##1}：
    \Field{\seq_item:Nn \g__agreement_party_name_seq {##1}}，
    身份证号：\Field{\seq_item:Nn \g__agreement_party_id_seq {##1}}\par
  }
}

\cs_new_protected:Npn \__agreement_print_signatures:
{
  \par\vspace{1em}
  \int_step_inline:nn {\seq_count:N \g__agreement_party_name_seq}
  {
    \__agreement_party_label:n{##1}：
    \Field{\seq_item:Nn \g__agreement_party_name_seq {##1}}，
    身份证号：\Field{\seq_item:Nn \g__agreement_party_id_seq {##1}}，
    签订时间：\Field{\seq_item:Nn \g__agreement_party_date_seq {##1}}\par
  }
}

\NewDocumentCommand{\MakeAgreement}{}
{
  \begin{center}
    \vspace*{15pt}
    {\fontsize{22pt}{26.5pt}\selectfont\bfseries 合作开发协议\par}
    \vspace{15pt}
  \end{center}

  \__agreement_print_party_list:

  鉴于，协议各方均为计算机软件专业开发人员，能够进行创造性的软件开发活动。并且，协议各方有意愿共同从事\__agreement_software_field: 软件的开发工作。为了规范各方的权利义务，在《中华人民共和国合同法》及其他相关法规政策的原则指导下，订立本协议书，各方共同遵守：

  \section{合作宗旨}
  为完成\__agreement_software_field: 软件的开发工作，并共同享有开发成果而合作。

  \section{合作项目和范围}
  协议各方共同开发\__agreement_software_field: 软件，合作范围包括软件的代码编写、调试、测试等开发工作。

  \section{合作期限}
  合作期限为一年。

  \section{合作方式}
  \begin{enumerate}
    \item 协议各方按照软件编程工作的正常分工进行编写，任何一方不得随意更改软件的重大功能和事项，以免对其余各方造成履约困难。
    \item 合作各方应坚持勤勉努力诚实信用的原则，进行各方分别负责的软件的编程工作，并考虑到各方软件的兼容和接合。如部分合作人发生特殊技术困难，其余合作方有义务为其提供合理适当的技术帮助。
  \end{enumerate}

  \section{知识产权}
  \begin{enumerate}
    \item 各方编写的软件源代码、技术文档及汇编而成的程序本身，其著作权均由合作方共同享有。
    \item 各作各方在编写软件的过程中，不得有侵犯他人知识产权的行为，否则，应对外承担全部侵权责任。
  \end{enumerate}

  \section{协议变更}
  \begin{enumerate}
    \item 经合作各方协商同意，本协议可以作相应变更
    \item 任何合作方未经与其他各方协商，擅自变更本协议条款或者将本协议权利义务转让他人，均为无效。
  \end{enumerate}

  \section{禁止行为}
  \begin{enumerate}
    \item 未经全体合作人同意，禁止任何合作人私自以团体名义进行业务活动如其业务获得利益归合作各方共有，造成损失按实际损失赔偿。
    \item 禁止合作人经营与团队相竞争的业务。
    \item 禁止合作方泄露本协议所涉及的相关商业秘密。
    \item 如合作人违反上述各条，应按实际损失赔偿。
  \end{enumerate}

  \section{合作的终止}
  合作开发活动因以下事由之一得终止：①全体合作人同意终止合作关系②合作项目因技术原因，根本不能完成③合作项目违反法律被撤销。

  \__agreement_print_signatures:
}

\ExplSyntaxOff
