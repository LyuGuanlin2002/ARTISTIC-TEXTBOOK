% !TEX program = xelatex
% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{textbook-cn}[By Lyu Guanlin]

\makeatletter
%%%%%%%%%%%%%%%%%%%% 自定义命令宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{xkeyval,kvoptions,etoolbox,ifthen,xifthen,xparse,expl3,letltxmacro}%设置键和键值%自定义命令
\SetupKeyvalOptions{family=TextBook,prefix=TextBook@,setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{TextBook}{#1}}
%%声明颜色键及默认值%%
\DeclareStringOption[blue]{themecolor}
\DeclareVoidOption{blue}{\ekv{themecolor=blue}}
\DeclareVoidOption{green}{\ekv{themecolor=green}}
\DeclareVoidOption{red}{\ekv{themecolor=red}}
\DeclareVoidOption{purple}{\ekv{themecolor=purple}}
\DeclareVoidOption{gray}{\ekv{themecolor=gray}}
\DeclareVoidOption{orange}{\ekv{themecolor=orange}}
\DeclareVoidOption{yellow}{\ekv{themecolor=yellow}}
\DeclareVoidOption{colorful}{\ekv{themecolor=colorful}}
\DeclareVoidOption{iris}{\ekv{themecolor=iris}}
\DeclareVoidOption{harvest}{\ekv{themecolor=harvest}}
\DeclareVoidOption{vineyard}{\ekv{themecolor=vineyard}}
\DeclareVoidOption{sunflower}{\ekv{themecolor=sunflower}}
\DeclareVoidOption{cypresses}{\ekv{themecolor=cypresses}}
\DeclareVoidOption{sunrise}{\ekv{themecolor=sunrise}}
%%声明参考文献生成方式布尔键%%
\DeclareBoolOption[false]{splitbib}
%%声明代码盒子生成方式布尔键%%
\DeclareBoolOption[false]{mintedcode}
%%声明文档出血线（裁切线）生成布尔键%%
\DeclareBoolOption[false]{trimline}
%%加载book作为基础文档类%%
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass{book}

%%%%%%%%%%%%%%%%%%%% 对原生命令的改动 %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% 在所有包加载之前 %%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%% 计算与文本内容风格宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{calc}%优化长度计算和设置
\RequirePackage{fp}%浮点数计算
\RequirePackage{ragged2e}%更美观的对齐设置
%%浮动环境设置%%
\renewcommand*{\textfraction}{0.05}
%%设置顶端和底端的浮动环境的最大比例%%
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
%%设置浮动环境占页比例阈值%%
\renewcommand*{\floatpagefraction}{0.85}%\floatpagefraction的数值必须小于\topfraction
%%
\RequirePackage[table,dvipsnames,svgnames,x11names]{xcolor}%颜色宏包，必须放在tikz之前
%%蓝色主题%%
\newcommand{\SetBlueTheme}{%
\definecolor{ColorA}{RGB}{68,114,210}
\definecolor{ColorB}{rgb}{0.3,0.52,1.0}
\colorlet{ColorC}{RoyalBlue}
\colorlet{ColorD}{RoyalBlue}
\colorlet{ColorE}{RoyalBlue3}
\colorlet{ColorF}{DodgerBlue2}
\colorlet{ColorG}{SteelBlue2}
\colorlet{ColorH}{DodgerBlue1}
\colorlet{ColorI}{CornflowerBlue}
}
\ifdefstring{\TextBook@themecolor}{blue}{\SetBlueTheme}{\relax}
%%红色主题%%
\newcommand{\SetRedTheme}{%
\colorlet{ColorA}{Firebrick2}
\colorlet{ColorB}{Brown2}
\colorlet{ColorC}{Crimson}
\colorlet{ColorD}{Tomato3}
\colorlet{ColorE}{Red}
\colorlet{ColorF}{Brown3}
\colorlet{ColorG}{Firebrick3}
\colorlet{ColorH}{Red2}
\colorlet{ColorI}{Red3}
}
\ifdefstring{\TextBook@themecolor}{red}{\SetRedTheme}{\relax}
%%绿色主题%%
\newcommand{\SetGreenTheme}{%
\definecolor{ColorA}{rgb}{0.3,0.6,0.3}
\definecolor{ColorB}{rgb}{0.4,0.7,0.4}
\colorlet{ColorC}{ForestGreen}
\colorlet{ColorD}{PaleGreen4}
\colorlet{ColorE}{SeaGreen4}
\colorlet{ColorF}{SpringGreen4}
\colorlet{ColorG}{Green4}
\colorlet{ColorH}{Chartreuse4}
\colorlet{ColorI}{Chartreuse3}
}
\ifdefstring{\TextBook@themecolor}{green}{\SetGreenTheme}{\relax}
%%紫色主题%%
\newcommand{\SetPurpleTheme}{%
\definecolor{ColorA}{RGB}{147,75,201}
\definecolor{ColorB}{RGB}{192,113,217}
\colorlet{ColorC}{BlueViolet}
\colorlet{ColorD}{Violet}
\colorlet{ColorE}{MediumOrchid3}
\colorlet{ColorF}{SlateBlue3}
\colorlet{ColorG}{DarkOrchid3}
\colorlet{ColorH}{MediumPurple}
\colorlet{ColorI}{MediumOrchid}
}
\ifdefstring{\TextBook@themecolor}{purple}{\SetPurpleTheme}{\relax}
%%橙色主题%%
\newcommand{\SetOrangeTheme}{%
\colorlet{ColorA}{Firebrick2}
\colorlet{ColorB}{Dandelion}
\colorlet{ColorC}{DarkOrange}
\colorlet{ColorD}{BurntOrange}
\colorlet{ColorE}{Chocolate2}
\colorlet{ColorF}{Tomato2}
\colorlet{ColorG}{Sienna1}
\colorlet{ColorH}{DarkOrange1}
\colorlet{ColorI}{OrangeRed}
}
\ifdefstring{\TextBook@themecolor}{orange}{\SetOrangeTheme}{\relax}
%%黄色主题%%
\newcommand{\SetYellowTheme}{%
\colorlet{ColorA}{Dandelion}
\colorlet{ColorB}{Goldenrod1}
\colorlet{ColorC}{Gold}
\colorlet{ColorD}{Gold1}
\colorlet{ColorE}{YellowOrange}
\colorlet{ColorF}{Goldenrod}
\colorlet{ColorG}{DarkGoldenrod}
\colorlet{ColorH}{Goldenrod2}
\colorlet{ColorI}{DarkGoldenrod2}
}
\ifdefstring{\TextBook@themecolor}{yellow}{\SetYellowTheme}{\relax}
%%棕色主题%%
\newcommand{\SetBrownTheme}{%
\definecolor{ColorA}{RGB}{132,60,12}
\definecolor{ColorB}{RGB}{180,90,0}
\definecolor{ColorC}{RGB}{99,45,9}
\definecolor{ColorD}{RGB}{61,28,5}
\definecolor{ColorE}{RGB}{135,61,11}
\definecolor{ColorF}{RGB}{197,80,17}
\definecolor{ColorG}{RGB}{237,122,43}
\definecolor{ColorH}{RGB}{107,49,9}
\definecolor{ColorI}{RGB}{151,69,13}
}
\ifdefstring{\TextBook@themecolor}{brown}{\SetBrownTheme}{\relax}
%%彩色主题%%
\newcommand{\SetColorfulTheme}{%
\definecolor{ColorA}{RGB}{132,60,12}
\definecolor{ColorB}{RGB}{180,90,0}
\definecolor{ColorC}{RGB}{84,130,53}
\definecolor{ColorD}{RGB}{192,0,0}
\definecolor{ColorE}{RGB}{240,146,82}
\definecolor{ColorF}{RGB}{0,122,59}
\definecolor{ColorG}{RGB}{68,114,196}
\definecolor{ColorH}{RGB}{231,120,12}
\definecolor{ColorI}{RGB}{171,68,171}
}
\ifdefstring{\TextBook@themecolor}{colorful}{\SetColorfulTheme}{\relax}
%%梵高鸢尾花主题%%
\newcommand{\SetIrisTheme}{%
\definecolor{ColorA}{RGB}{33,48,137}
\definecolor{ColorB}{RGB}{49,82,160}
\definecolor{ColorC}{RGB}{209,128,50}
\definecolor{ColorD}{RGB}{76,125,59}
\definecolor{ColorE}{RGB}{167,43,28}
\definecolor{ColorF}{RGB}{101,164,126}
\definecolor{ColorG}{RGB}{98,159,202}
\definecolor{ColorH}{RGB}{122,42,15}
\definecolor{ColorI}{RGB}{166,201,92}
}
\ifdefstring{\TextBook@themecolor}{iris}{\SetIrisTheme}{\relax}
%%梵高收获主题%%
\newcommand{\SetHarvestTheme}{%
\definecolor{ColorA}{RGB}{150,99,52}
\definecolor{ColorB}{RGB}{196,151,67}
\definecolor{ColorC}{RGB}{154,119,66}
\definecolor{ColorD}{RGB}{48,76,99}
\definecolor{ColorE}{RGB}{99,154,151}
\definecolor{ColorF}{RGB}{93,127,131}
\definecolor{ColorG}{RGB}{155,154,97}
\definecolor{ColorH}{RGB}{184,160,142}
\definecolor{ColorI}{RGB}{211,198,156}
}
\ifdefstring{\TextBook@themecolor}{harvest}{\SetHarvestTheme}{\relax}
%%梵高庄园主题%%
\newcommand{\SetVineyardTheme}{%
\definecolor{ColorA}{RGB}{124,24,11}
\definecolor{ColorB}{RGB}{210,83,62}
\definecolor{ColorC}{RGB}{197,103,69}
\definecolor{ColorD}{RGB}{75,129,154}
\definecolor{ColorE}{RGB}{77,108,135}
\definecolor{ColorF}{RGB}{118,167,201}
\definecolor{ColorG}{RGB}{214,170,74}
\definecolor{ColorH}{RGB}{195,150,58}
\definecolor{ColorI}{RGB}{66,75,109}
}
\ifdefstring{\TextBook@themecolor}{vineyard}{\SetVineyardTheme}{\relax}
%%梵高向日葵主题%%
\newcommand{\SetSunflowerTheme}{%
\definecolor{ColorA}{RGB}{159,113,3}
\definecolor{ColorB}{RGB}{177,109,38}
\definecolor{ColorC}{RGB}{127,68,29}
\definecolor{ColorD}{RGB}{152,127,71}
\definecolor{ColorE}{RGB}{56,116,53}
\definecolor{ColorF}{RGB}{156,176,66}
\definecolor{ColorG}{RGB}{114,118,124}
\definecolor{ColorH}{RGB}{185,161,111}
\definecolor{ColorI}{RGB}{206,194,72}
}
\ifdefstring{\TextBook@themecolor}{sunflower}{\SetSunflowerTheme}{\relax}
%%梵高丝柏树主题%%
\newcommand{\SetCypressesTheme}{%
\definecolor{ColorA}{RGB}{53,77,19}
\definecolor{ColorB}{RGB}{62,113,103}
\definecolor{ColorC}{RGB}{182,177,85}
\definecolor{ColorD}{RGB}{224,188,156}
\definecolor{ColorE}{RGB}{104,112,40}
\definecolor{ColorF}{RGB}{91,142,148}
\definecolor{ColorG}{RGB}{52,104,100}
\definecolor{ColorH}{RGB}{131,160,177}
\definecolor{ColorI}{RGB}{32,47,68}
}
\ifdefstring{\TextBook@themecolor}{cypresses}{\SetCypressesTheme}{\relax}
%%莫奈印象日出主题%%
\newcommand{\SetSunriseTheme}{%
\definecolor{ColorA}{RGB}{211,104,81}
\definecolor{ColorB}{RGB}{201,155,144}
\definecolor{ColorC}{RGB}{173,134,102}
\definecolor{ColorD}{RGB}{95,136,139}
\definecolor{ColorE}{RGB}{63,92,79}
\definecolor{ColorF}{RGB}{189,157,138}
\definecolor{ColorG}{RGB}{135,131,115}
\definecolor{ColorH}{RGB}{129,90,59}
\definecolor{ColorI}{RGB}{107,127,125}
}
\ifdefstring{\TextBook@themecolor}{sunrise}{\SetSunriseTheme}{\relax}

%%定义书籍信息%%
\newcommand{\serieslogo}[1]{\long\def\@serieslogo{#1}}
\newcommand{\seriesname}[1]{\long\def\@seriesname{#1}}
\newcommand{\version}[1]{\long\def\@version{#1}}
\newcommand{\subtitle}[1]{\long\def\@subtitle{#1}}
\newcommand{\englishtitle}[1]{\long\def\@englishtitle{\MakeUppercase{#1}}}
\newcommand{\englishsubtitle}[1]{\long\def\@englishsubtitle{\MakeUppercase{#1}}}
\newcommand{\presslogo}[1]{\long\def\@presslogo{#1}}
\newcommand{\pressname}[1]{\long\def\@pressname{#1}}
\newcommand{\bookintro}[1]{\long\def\@bookintro{#1}}

%%%%%%%%%%%%%%%%%%%% 字体设置 %%%%%%%%%%%%%%%%%%%%
\RequirePackage[fontset=none]{ctex}%中文文本
%%%%
\xeCJKsetup{%
CJKecglue={\hspace{0.25em plus 0.1em minus 0.08em}}%中英文间距微调推荐值
}
%%%%
\RequirePackage{fontspec}%字体设置宏包
\RequirePackage{mathptmx}%数学字体设置宏包
%%设置英文字体%%
%%主字体
\setmainfont[
Path=fonts/,
BoldFont=LinLibertineRB.otf,
ItalicFont=LinLibertineRI.otf,
BoldItalicFont=LinLibertineRBI.otf,
]{LinLibertineR.otf}
%%无衬线字体
\setsansfont[
Path=fonts/,
BoldFont=GOTHICB.ttf,
ItalicFont=GOTHICI.ttf,
BoldItalicFont=GOTHICBI.ttf
]{GOTHIC.ttf}
%%等宽字体
\setmonofont[
Path=fonts/,
BoldFont=courbd.ttf,
ItalicFont=couri.ttf,
BoldItalicFont=courbi.ttf
]{cour.ttf}

%%设置中文字体%%
%%主字体
\setCJKmainfont[
Path=fonts/,
BoldFont=Source Han Serif SC Heavy.otf,
ItalicFont=Source Han Serif SC Regular Italic.ttf,
BoldItalicFont=Source Han Serif SC Heavy Italic.ttf
]{Source Han Serif SC Regular.otf}
%%无衬线字体
\setCJKsansfont[
Path=fonts/,
BoldFont=Source Han Sans SC Heavy.otf,
ItalicFont=Source Han Sans SC Regular Italic.ttf,
BoldItalicFont=Source Han Sans SC Heavy Italic.ttf
]{Source Han Sans SC Regular.otf}
%%等宽字体
\setCJKmonofont[
Path=fonts/,
BoldFont=FZCukai.ttf,
ItalicFont=FZKai.ttf,
BoldItalicFont=FZCukai.ttf
]{FZKai.ttf}

%%楷体设置
\newCJKfontfamily\kaiti{FZKai.ttf}[
Path=fonts/,
BoldFont=FZCukai.ttf]

%%水印字体设置
\newCJKfontfamily\shuiyin{WaterMarkFont.ttf}[
Path=fonts/,
BoldFont=WaterMarkFont.ttf]

%%单独修改行距命令%%
\def\set@baselineskip#1#2{%
\@defaultunits\@tempskipa#2pt\relax\@nnil
\edef\f@baselineskip{\the\@tempskipa}%
\edef\f@linespread{#1}%
\let\baselinestretch\f@linespread
\def\size@update{%
\baselineskip\f@baselineskip\relax
\baselineskip\f@linespread\baselineskip
\normalbaselineskip\baselineskip
\setbox\strutbox\hbox{%
\vrule\@height.7\baselineskip
\@depth.3\baselineskip
\@width\z@}%
\let\size@update\relax}%
}
\let\size@update\relax
%%%%
\DeclareRobustCommand{\setbaselineskip}[1]{%
\set@baselineskip\baselinestretch{#1}%
}

%%简化字体命令%%
\newcommand{\FontSizeSet}[2][1.5]{\fontsize{#2}{\fpeval{#1*#2}}\selectfont}
%%字号设置%%
\newcommand{\TitlepageNormalFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{15pt}}%标题页正常字体
\newcommand{\TitlepageStripeFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{16pt}}%标题页条带字体
\newcommand{\TitlepageTitleFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{40pt}}%标题页主标题字体
\newcommand{\TitlepageSubtitleFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{30pt}}%标题页次标题字体
\newcommand{\TitlepageEnglishFont}{\upshape\sffamily\bfseries\FontSizeSet[1.2]{18pt}}%标题页英文标题字体
\newcommand{\PartLabelFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{34pt}}%部分标签字体
\newcommand{\PartNameFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{32pt}}%部分名称字体
\newcommand{\ChapterLabelFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{27pt}}%章标签字体
\newcommand{\ChapterNameFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{25pt}}%章名称字体
\newcommand{\ChapterSayingFont}{\itshape\kaiti\FontSizeSet[1.2]{14pt}}%章谚语字体
\newcommand{\SectionFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{18pt}}%节字体
\newcommand{\SubsectionFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.3]{15pt}}%小节字体
\newcommand{\SubsubsectionFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{14.5pt}}%小小节字体
\newcommand{\ParagraphNameFont}{\upshape\rmfamily\bfseries\FontSizeSet{14pt}}%段落名称字体
\newcommand{\HeaderFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{14pt}}%页眉字体
\newcommand{\FooterFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{14pt}}%页脚字体
\newcommand{\PageNumberFont}{\upshape\sffamily\bfseries\FontSizeSet{16pt}}%页码字体
\newcommand{\PartNumberFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{14pt}}%部分标签字体
\newcommand{\ThumbFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{14pt}}%侧标字体
\newcommand{\CaptionFont}{\upshape\rmfamily\FontSizeSet[1.2]{14pt}}%图表标签字体
\newcommand{\TocPartFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.3]{15pt}}%目录部分字体
\newcommand{\TocChapterFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{14pt}}%目录章字体
\newcommand{\TocSectionFont}{\upshape\rmfamily\FontSizeSet[1.2]{14pt}}%目录节字体
\newcommand{\TocSubsectionFont}{\upshape\rmfamily\FontSizeSet[1.2]{14pt}}%目录小节字体
\newcommand{\TocSubsubsectionFont}{\upshape\rmfamily\FontSizeSet[1.2]{14pt}}%目录小小节字体
\newcommand{\LoftFont}{\upshape\rmfamily\FontSizeSet[1.2]{14pt}}%图表列表字体
\newcommand{\LTitleFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{14pt}}%小目录标题
\newcommand{\TocLChapterFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{14pt}}%小目录章字体
\newcommand{\TocLSectionFont}{\upshape\rmfamily\FontSizeSet[1.2]{14pt}}%小目录节字体
\newcommand{\TocLSubsectionFont}{\upshape\rmfamily\FontSizeSet[1.2]{14pt}}%小目录小节字体
\newcommand{\TocLSubsubsectionFont}{\upshape\rmfamily\FontSizeSet[1.2]{14pt}}%小目录小小节字体
\newcommand{\LoftLFont}{\upshape\rmfamily\FontSizeSet[1.2]{14pt}}%小图表列表字体
\newcommand{\ContentPageNumFont}{\upshape\sffamily\FontSizeSet{14pt}}%目录页码字体
\newcommand{\CiteNumFont}{\upshape\rmfamily}%引用字体
\newcommand{\LineNumFont}{\upshape\sffamily\bfseries\FontSizeSet{11pt}}%行号字体
\newcommand{\ListNumFont}{\upshape\sffamily\bfseries\FontSizeSet{12pt}}%列表序号字体
\newcommand{\HeadingFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{13pt}}%一般标题字体
\newcommand{\EgLabelFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.2]{13pt}}%例题标签字体
\newcommand{\BoxTitleFont}{\upshape\rmfamily\bfseries\FontSizeSet[1.3]{13pt}}%盒子标题字体
\newcommand{\BoxSubtitleFont}{\upshape\rmfamily\bfseries\FontSizeSet{13pt}}%盒子副标题字体
\newcommand{\BoxLogoFont}{\upshape\rmfamily\bfseries\FontSizeSet{16pt}}%盒子logo字体
\newcommand{\BoxSublogoFont}{\upshape\rmfamily\bfseries\FontSizeSet{14pt}}%盒子小logo字体
\newcommand{\MarginNoteFont}{\itshape\kaiti\FontSizeSet[1.2]{13pt}}%边注字体
\newcommand{\FootNoteFont}{\itshape\kaiti\FontSizeSet[1.2]{13pt}}%脚注字体
\newcommand{\ItemFont}{\kaiti}%列表字体
\newcommand{\MainFont}{\upshape\rmfamily\FontSizeSet[1.4]{14pt}}%正文字体

%%%%%%%%%%%%%%%%%%%% 页面布局设定宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{setspace}%行距设置
%%边注宽度设置%%
\gdef\@MarginColumn@Ratio{0.25}
\gdef\@MainColumn@Ratio{\fpeval{1-\@MarginColumn@Ratio}}
%%%%
\newlength{\@innerlen}
\newlength{\@outerlen}
\newlength{\@toplen}
\newlength{\@botlen}
%%%%
\setlength{\@innerlen}{2.75cm}
\setlength{\@outerlen}{2.5cm}
\setlength{\@toplen}{2.5cm}
\setlength{\@botlen}{2.5cm}
%%%%
\RequirePackage{geometry}
\geometry{letterpaper,headsep=0.75cm,footskip=0.75cm,inner=\@innerlen,outer=\@outerlen,top=\@toplen,bottom=\@botlen,columnsep=1.25cm,reversemarginpar,heightrounded}
%%
\setlength{\textwidth}{\paperwidth-\@outerlen-\@innerlen}
\setlength{\marginparwidth}{\dimeval{\@MarginColumn@Ratio\textwidth}}
\setlength{\marginparsep}{-\marginparwidth}
\setlength{\columnseprule}{0pt}
%%%%
\RequirePackage{fancyhdr,extramarks}%页眉页脚样式设置%创建额外的标记，使用方法类似于\markboth和\markright
%%
\RequirePackage[strict]{changepage}%临时修改页面的尺寸
%%边注格式%%
\RequirePackage{marginnote}
%%修改边注字体
\gdef\marginfont{\MarginNoteFont}
\gdef\raggedleftmarginnote{\setlength{\parindent}{2.0em}}
\gdef\raggedrightmarginnote{\setlength{\parindent}{2.0em}}
%%重定义原始\marginpar命令，设置首行缩进和字体
\NewCommandCopy{\originmarginpar}{\marginpar}
%%原生\marginpar命令的第一个参数为可选参数，且默认值为第二个参数的值
\RenewDocumentCommand{\marginpar}{+O{#2} +m}{%
\originmarginpar[{\raggedleftmarginnote\marginfont#1}]{\raggedrightmarginnote\marginfont#2}}

%%脚注格式%%
\RequirePackage{fnpos}%脚注位置控制
\makeFNbottom%确保脚注始终生成在版心底部，不论是否加载了\raggedbottom命令
\RequirePackage{footnotehyper}%提供\makesavenoteenv命令以保证其他环境内的脚注编号正确生成
\gdef\footnoterule{}
\gdef\footnotesize{\FootNoteFont}
%%修改minipage中的脚注计数器
\newcommand{\@change@minipage@footnote}{%
\def\@mpfn{footnote}%
\def\thempfn{\thefootnote}%
}
%%%%
\RequirePackage{multicol,paracol}%多栏%分栏、边注、中英对照
\setlength{\multicolsep}{0pt}%取消multicol环境前的垂直空白距离
%%%%
\columnratio{\@MainColumn@Ratio}
\footnotelayout{m}
\twosided[pcm]
%%paracol源代码修正%%
%%Start New Page: \pcol@startpage在换页时（无论是被动或主动）调用，paracol环境开始的第一页则不调用%%
\NewCommandCopy{\originpcol@startpage}{\pcol@startpage}
\def\pcol@startpage{%
\newdimen\@DefaultTextheight%
\@DefaultTextheight=\dimexpr\paperheight-\@toplen-\@botlen\relax%
\textheight\@DefaultTextheight%
\originpcol@startpage}
%%%%
\NewCommandCopy{\originpcol@flushfloats}{\pcol@flushfloats}
\def\pcol@flushfloats{%
\newdimen\@DefaultTextheight%
\@DefaultTextheight=\dimexpr\paperheight-\@toplen-\@botlen\relax%
\textheight\@DefaultTextheight%
\originpcol@flushfloats}
%%%%
%%出血线宽度
\newlength{\@ExtraWidth}
\setlength{\@ExtraWidth}{0mm}
%%根据布尔变量加载文档裁切线宏包%%
\ifTextBook@trimline
\newlength{\trimlinewidth}
\setlength{\trimlinewidth}{1.0in}
\setlength{\stockwidth}{\paperwidth+\trimlinewidth}
\setlength{\stockheight}{\paperheight+\trimlinewidth}
\setlength{\@ExtraWidth}{3.0mm}
\RequirePackage[cam,width=\stockwidth,height=\stockheight,center,noinfo,axes]{crop}
\fi

%%%%%%%%%%%%%%%%%%%% 图表插入宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}%插入图片路径
\RequirePackage{caption}%图表标签
\RequirePackage{subcaption}%图表标签
%%设置图片和表格格式%%
\renewcommand{\captionfont}{\color{ColorB}\CaptionFont}
%%
\@removefromreset{figure}{chapter}%移除figure对chapter的依赖
\@addtoreset{figure}{section}%添加figure对section的依赖
%%
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
%%
\renewcommand{\thefigure}{%
\if@mainmatter%	
\the@prenumber.\arabic{figure}%
\fi}
\renewcommand{\thetable}{%
\if@mainmatter%	
\the@prenumber.\arabic{table}%
\fi}
%%
\def\fnum@figure{{\color{ColorB!50}\faSquare}\nobreakspace\figurename\nobreakspace{\sffamily\environmentmark\thefigure}}
\def\fnum@table{{\color{ColorB!50}\faSquare}\nobreakspace\tablename\nobreakspace{\sffamily\environmentmark\thetable}}
%%
\renewcommand{\subfigurename}{图}
\renewcommand{\subtablename}{表}
%%定义非浮动体标签%%
\newcommand{\nonfloatfigcaption}{\setcaptiontype{figure}\caption} 
\newcommand{\nonfloattabcaption}{\setcaptiontype{table}\caption}
%%表格宏包%%
\RequirePackage{tabularray}
\UseTblrLibrary{amsmath,hook,tikz,diagbox,booktabs,varwidth}

%%%%%%%%%%%%%%%%%%%% 目录宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage[explicit,newparttoc,notocpart*]{titlesec}%设置标题格式
%%newparttoc: 可以修改部分在目录中的样式
%%notocpart*: *版本的part不计入目录
\RequirePackage{titletoc}%目录格式设置
\RequirePackage{shorttoc}%简洁目录设置
\def\shorttocname#1{#1}%定义简洁目录标题宏
\renewcommand{\contentsname}{目录}%更改目录标题
\renewcommand{\listfigurename}{插图目录}%更改图片目录标题
\renewcommand{\listtablename}{表格目录}%更改表格目录标题
\renewcommand{\shorttocname}{内容概览}%更改简洁目录标题
%%目录计数器%%
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{1}
%%定义在目录中插入边注文字和图片的命令%%
\NewDocumentCommand{\addmarginparintoc}{ +m O{0pt} }{%
\addtocontents{toc}{\protecting{\marginnote{{#1}}[#2]}}%
}
%%按照\marginpar原有传参逻辑重定义\marginpar，此命令用在其他目录命令中，防止有边注模式的主目录影响其他目录%%
\newcommand{\@erase@marginpar}{%
\def\marginpar{%
\@ifnextchar[%
{\@temp@marginpar@i}
{\@temp@marginpar@ii}}
%%
\def\@temp@marginpar@i[##1]##2{}
\def\@temp@marginpar@ii##1{}
}
%%按照\marginnote原有传参逻辑重定义\marginnote，此命令用在其他目录命令中，防止有边注模式的主目录影响其他目录%%
\newcommand{\@erase@marginnote}{%
\def\marginnote{%
\@ifnextchar[%
{\@temp@marginnote@A}%
{\@temp@marginnote@noA}%
}
%%
\def\@temp@marginnote@A[##1]##2{%
\@ifnextchar[%     
{\@temp@marginnote@bothAB[##1]{##2}}
{\@temp@marginnote@onlyA[##1]{##2}}
}
%%
\def\@temp@marginnote@noA##1{%
\@ifnextchar[%     
{\@temp@marginnote@onlyB{##1}}
{\@temp@marginnote@noAB{##1}}
}
%%
\def\@temp@marginnote@bothAB[##1]##2[##3]{}
\def\@temp@marginnote@onlyA[##1]##2{}
\def\@temp@marginnote@onlyB##1[##2]{}
\def\@temp@marginnote@noAB##1{}
}

%%重定义\tableofcontents%%
\RenewDocumentCommand{\tableofcontents}{ s O{1} }{%
\begingroup%确保计数器值和重定义只在局部生效
\chapter*{\contentsname}%
\IfBooleanTF{#1}{%
\@gobble{#2}%这一分支不需要#2参数，如果检测到#2的输入，则“吃掉”#2
\begin{paracol}{2}%
\@starttoc{toc}%
\end{paracol}%
}{%
%%局部清空\marginpar的定义，防止边注模式的主目录影响其他目录%%
\@erase@marginpar
%%局部清空\marginnote的定义，防止边注模式的主目录影响其他目录%%
\@erase@marginnote
%%
\ifnum#2=1%
\@starttoc{toc}%
\else%
\begin{multicols}{#2}%
\@starttoc{toc}%
\end{multicols}%
\fi}
\endgroup}
%%重定义\listoffigures%%
\RenewDocumentCommand{\listoffigures}{O{1}}{%
\begingroup%确保计数器值和重定义只在局部生效
%%清除跟随在\chapter命令后在lof和lot文件中插入的垂直间距%%
\def\ttl@tocsep{}
%%局部清空\marginpar的定义，防止边注模式的主目录影响其他目录%%
\@erase@marginpar
%%局部清空\marginnote的定义，防止边注模式的主目录影响其他目录%%
\@erase@marginnote
%%
\chapter*{\listfigurename}%
\ifnum#1=1%
\@starttoc{lof}%
\else%
\begin{multicols}{#1}
\@starttoc{lof}
\end{multicols}
\fi%
\endgroup}
%%重定义\listoftables%%
\RenewDocumentCommand{\listoftables}{O{1}}{%
\begingroup%确保计数器值和重定义只在局部生效
%%清除跟随在\chapter命令后在lof和lot文件中插入的垂直间距%%
\def\ttl@tocsep{}
%%局部清空\marginpar的定义，防止边注模式的主目录影响其他目录%%
\@erase@marginpar
%%局部清空\marginnote的定义，防止边注模式的主目录影响其他目录%%
\@erase@marginnote
%%
\chapter*{\listtablename}
\ifnum#1=1%
\@starttoc{lot}%
\else%
\begin{multicols}{#1}
\@starttoc{lot}
\end{multicols}
\fi%
\endgroup}
%%重定义\shorttableofcontents%%
\RenewDocumentCommand{\shorttableofcontents}{O{1}}{%
\begingroup%确保计数器值和重定义只在局部生效
%%局部清空\marginpar的定义，防止边注模式的主目录影响其他目录%%
\@erase@marginpar
%%局部清空\marginnote的定义，防止边注模式的主目录影响其他目录%%
\@erase@marginnote
%%
\chapter*{\shorttocname}
\c@tocdepth=0%预设目录深度为0
\ifnum#1=1%
\@startshorttoc{toc}
\else
\begin{multicols}{#1}
\@startshorttoc{toc}
\end{multicols}
\fi
\endgroup}

%%%%%%%%%%%%%%%%%%%% 参考文献宏包 %%%%%%%%%%%%%%%%%%%%
%%参考文献编译方式：先用XeLaTeX编译主文件.tex一次；再用BibTeX编译主文件（或各子文件）.aux一次；然后用XeLaTeX编译主文件.tex两次%%
\RequirePackage{xstring}%字符串处理宏包
\RequirePackage[numbers,sectionbib]{natbib}%参考文献格式
\renewcommand{\bibnumfmt}[1]{\protect\NumberedLabel{#1}}%修改参考文献序号样式
\renewcommand{\citenumfont}[1]{\color{ColorA}\CiteNumFont#1}%修改引用样式
\bibpunct{\color{ColorA}{[}}{\color{ColorA}{]}}{,}{n}{}{;}%修改方括号颜色
\renewcommand{\bibname}{参考文献}%修改参考文献标题
%%加载宏包chapterbib时需要对各章节的tex文件进行bibtex编译，而不能对主tex文件进行bibtex编译%%
\ifTextBook@splitbib
\RequirePackage{chapterbib}%分章节显示参考文献，且参考文献编号各自独立
\fi
%%参考文献输出设置%%
\NewDocumentCommand{\printbib}{O{\chapter*} m s}{%
\colorlet{ListColor}{ColorA}%
\def\@biblevel{#1}%
%判断参考文献的层次是否是带*版本
\IfSubStr{#1}{*}{%
\IfBooleanTF{#3}{%
%如果是带*版本且参数#3被传入*，则提取层次字符串（例如，参数#1为\chapter*，则提取为“chapter”
%\@tempcmd为去除反斜杠“\”的层次，即“chapter*”
\edef\@tempcmd{\expandafter\@gobble\string#1}%
%\@clean@tempcmd为进一步去除*的层次，即“chapter”
\def\@clean@tempcmd{\@tempcmd}%
\IfSubStr{\@tempcmd}{*}{%
\StrBefore{\@tempcmd}{*}[\@clean@tempcmd]%
}{\relax}%
%创建目录条目
\phantomsection%
\addcontentsline{toc}{\@clean@tempcmd}{\bibname}%
}{\relax}%
}{\relax}
\def\bibsection{\@biblevel{\bibname}}%
\bibliographystyle{plain}%
\bibliography{#2}%
}

%%%%%%%%%%%%%%%%%%%% 数学符号宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amsfonts,amssymb,mathrsfs,array,bm,upgreek}%数学宏包
\RequirePackage{mathptmx}%数学字体宏包
%%定义罗马数字%%
\newcommand{\rmnum}[1]{\romannumeral #1}
\newcommand{\Rmnum}[1]{\expandafter\@slowromancap\romannumeral #1@}

%%%%%%%%%%%%%%%%%%%% 盒子和列表宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage[most]{tcolorbox}%彩色盒子
\tcbuselibrary{xparse}
%%
\ifTextBook@mintedcode
\tcbuselibrary{minted}
\fi
%%
\makesavenoteenv{tcolorbox}%确保tcb环境内的脚注正确生成
\RequirePackage{empheq}%数学公式盒子
\RequirePackage{adjustbox,varwidth}%自动调整字体大小的盒子%固定可变长度盒子
\makesavenoteenv{varwidth}%确保varwidth环境内的脚注正确生成
\RequirePackage{enumitem,hlist}%控制列表环境格式%对齐列表环境
\RequirePackage{listings}%伪代码环境
%%
\ifTextBook@mintedcode
\RequirePackage{minted}%伪代码环境
\usemintedstyle{xcode}
%为了使宏包minted正常工作，需要在xelatex编译器参数中添加-shell-escape
\fi
%%
\RequirePackage{lineno}%行号宏包
\modulolinenumbers[5]%每5行显示一个行号
\renewcommand{\linenumberfont}{\color{ColorA}\LineNumFont}%修改行号字体
\setlength{\linenumbersep}{5.0mm}%修改行号与正文的间距
\RequirePackage{fancyvrb}%代码盒子
%%修改代码盒子左侧行数样式%%
\renewcommand{\theFancyVerbLine}{\color{ColorA}\LineNumFont{\arabic{FancyVerbLine}}}

%%%%%%%%%%%%%%%%%%%% 绘图与表格宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{pifont,fontawesome5}%图标
\RequirePackage{anyfontsize}%自由调整字体大小
\RequirePackage{tikzducks}%鸭子绘制
%%黑西装礼帽鸭
\newcommand{\BlackDuck}[1][1]{%
\tikz[scale=#1]{%
\duck[body=brown!50!white,head=brown!50!white,bill=Chocolate,eye=white,beard=white!80!brown,%
tshirt=black,buttons=white,tophat=black,wine=red!70!black]%
}}
%%蓝衣长发鸭
\newcommand{\BlueDuck}[1][1]{%
\tikz[scale=#1]{%
\duck[laughing,%
longhair=red!50!black,body=Melon,head=Melon,bill=Chocolate,eye=white,%
tshirt=CornflowerBlue!80!black,buttons=CornflowerBlue!40!black,bowtie=red!80!black,handbag=red!70!black]%
}}
%%眼睛博士鸭
\newcommand{\RedDuck}[2][1]{%
\tikz[scale=#1]{%
\duck[laughing,%
body=Tan!70!white,head=Tan!70!white,bill=Chocolate,eye=white,%
tshirt=white,jacket=red!50!black,tie=DodgerBlue!60!black,%
graduate=gray!20!black,tassel=red!70!black,%
squareglasses=blue!50!black,%
signpost=\scalebox{#1}{\bfseries\sffamily\color{red!50!black}#2},signcolour=brown!70!gray,signback=white!80!brown]%
}}
%%撞色拼接鸭
\newcommand{\MixedDuck}[1][1]{%
\tikz[scale=#1]{%
\duck[body=BurlyWood!60,head=BurlyWood!60,bill=Chocolate,eye=white,%
tshirt=white,jacket=LightSkyBlue!80!gray,beret=red!50!black,%
stripes={\stripes[color=LightSkyBlue!40!black,width=0.46,distance=3]},%
book=\scalebox{\fpeval{0.35*#1}}{\bfseries\sffamily ABC},bookcolour=blue!30!black]%
}}
%%%%
\RequirePackage{pgfplots,tikz,tikzpagenodes,tkz-euclide,eso-pic}%绘图
\pgfplotsset{compat=1.18}
\usetikzlibrary{fit,calc,math,scopes,backgrounds,positioning,intersections,shadows,shadings,fadings,arrows,arrows.meta,patterns,patterns.meta,shapes.geometric,decorations,decorations.pathmorphing,decorations.text,decorations.shapes,shapes.symbols}
\makesavenoteenv{tikzpicture}%确保tikz环境内的脚注正确生成
\makesavenoteenv{pgfonlayer}%确保pgfonlayer环境内的脚注正确生成
%%修改addtolength的作用域%%
\newcommand{\gaddtolength}[1]{\calc@assign@skip{\global\advance#1}}
%%修改setlength的作用域%%
\newcommand{\gsetlength}[2]{%
\begingroup
\setlength\skip@{#2}
\global#1=\skip@
\endgroup}
%%修改textheight%%
\newcommand{\changetextheight}[1]{%
\gaddtolength{\textheight}{#1}
\gsetlength{\@colht}{\textheight}
\gsetlength{\@colroom}{\textheight}
\gsetlength{\vsize}{\textheight}
}
%%\strut盒子高度调整%%
\newcommand{\AdjustStrut}[1]{%
\setbox\strutbox\hbox{%
\vrule height #1\ht\strutbox depth #1\dp\strutbox width\z@
}}
%%定义改进的\llap，使其能够指定其中内容向左偏移的距离%%
\DeclareRobustCommand{\xllap}[2]{\hb@xt@\z@{\hskip-#1 #2}}
%%定义改进的\rlap，使其能够指定其中内容向右偏移的距离%%
\DeclareRobustCommand{\xrlap}[2]{\hb@xt@\z@{\hskip#1 #2}}
%%测量节点node尺寸%%
\def\pgfgetnodeheight(#1)#2{
\begin{pgfinterruptboundingbox}
\path($(#1.south)-(#1.north)$);
\end{pgfinterruptboundingbox}
\pgfmathsetmacro#2{veclen(\pgf@x,\pgf@y)}
\edef#2{#2pt}}
%%
\def\pgfgetnodewidth(#1)#2{
\begin{pgfinterruptboundingbox}
\path($(#1.east)-(#1.west)$);
\end{pgfinterruptboundingbox}
\pgfmathsetmacro#2{veclen(\pgf@x,\pgf@y)}
\edef#2{#2pt}}
%%测量任意两点的距离%%
\def\pgfgetdistance(#1)(#2)#3{
\begin{pgfinterruptboundingbox}
\path($(#1)-(#2)$);
\end{pgfinterruptboundingbox}
\pgfmathsetmacro#3{veclen(\pgf@x,\pgf@y)}
\edef#3{#3pt}}

%%%%%%%%%%%%%%%%%%%% 超链接宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{url}%超链接
\RequirePackage[hidelinks,pagebackref]{hyperref}%超链接设置

%%%%%%%%%%%%%%%%%%%% 计数器宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{totcount}%获取计数器的最大值
%%定义计数器%%
\newcounter{@Chapter@Number}%记录当前chapter的序数，包括\chapter*
\regtotcounter{@Chapter@Number}%获取页面侧标总数，需要编译两次才能正确获取
%%%%
\newcounter{@Part@Number}%记录当前part的序数，包括\part*
\regtotcounter{@Part@Number}%获取章节页侧标总数，需要编译两次才能正确获取
%%%%
\newcounter{@example}[section]
\newcounter{@variant}[section]
\newcounter{@definition}[section]
\newcounter{@theorem}[section]
\newcounter{@axiom}[section]
\newcounter{@lemma}[section]
\newcounter{@corollary}[section]
\newcounter{@proposition}[section]
\newcounter{@check}
\newcounter{@comprehension}
\newcounter{@cloze}
\newcounter{@sidemark}[section]
\newcounter{@sidethink}[section]
\newcounter{@sideinfo}[section]
%%%%
\renewcommand{\thesubfigure}{\thefigure.\Alph{subfigure}}
\renewcommand{\thesubtable}{\thetable.\Alph{subtable}}
\renewcommand{\thepart}{\arabic{part}}
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}

%%%%%%%%%%%%%%%%%%%% 列表环境 %%%%%%%%%%%%%%%%%%%%%%
%%列表颜色设置%%
\colorlet{ListColor}{ColorA}
%%设置不编号点样式%%
\newcommand{\UnnumberedLabel}{%
\tikz[baseline=-0.4em]{%
\draw[ListColor,fill=white,ultra thick](0,0)circle(0.45em);
\draw[ListColor,fill=ListColor](0,0)circle(0.225em);
}}
%%设置编号点样式%%
\newcommand*{\NumberedLabel}[1]{%
\tikz[baseline=-0.4em]{%
\node[circle,fill=ListColor,draw=ListColor,ultra thick,minimum size=1.0em,align=center,inner sep=0mm,outer sep=0mm,font=\ListNumFont,text=white]{\maxsizebox{0.9em}{!}{#1}};}}
%%%%
%%无编号列表环境%%
\NewDocumentEnvironment{UnnumberedItem}{O{1} +O{}}{%
\setlist[itemize]{leftmargin=0mm,labelsep=0mm,itemsep=0mm,labelwidth=1.5em,itemindent=1.5em,align=left,label=\protect\UnnumberedLabel}%
\ifnum#1=1%
\begin{itemize}[#2]%
\else%
\begin{multicols}{#1}%
\ItemFont%
\begin{itemize}[#2]%
\fi%
}{%
\ifnum#1=1%
\end{itemize}%
\else%
\end{itemize}%
\end{multicols}%
\fi}

%%编号列表环境%%
\NewDocumentEnvironment{NumberedItem}{O{1} +O{} m}{%
\ifnum#3=1%
\setlist[enumerate]{leftmargin=0em,labelsep=0mm,itemsep=0mm,labelwidth=1.5em,itemindent=1.5em,align=left,label=\protect\NumberedLabel{\arabic*}}%
\else%
\ifnum#3=2%
\setlist[enumerate]{leftmargin=1.0em,labelsep=0mm,itemsep=0mm,labelwidth=1.5em,itemindent=1.5em,align=left,label=\protect\NumberedLabel{\alph*}}%
\else%
\ClassError{textbook-cn}{The level of the NumberedItem environment is only 1 or 2!}{}%
\fi\fi%
\ifnum#1=1%
\begin{enumerate}[#2]%
\else%
\begin{multicols}{#1}%
\ItemFont%
\begin{enumerate}[#2]%
\fi%
}{%
\ifnum#1=1%
\end{enumerate}%
\else%
\end{enumerate}%
\end{multicols}%
\fi}

%%题序号环境%%
%临时计数器，储存每个列表环境的最后一条item的序号%
\newcounter{@temp@item}[section]
\setcounter{@temp@item}{0}
%%%%
\NewDocumentEnvironment{QuestionItem}{O{1} +O{} m}{%
\ifnum#3=1%
\setlist[enumerate]{leftmargin=0em,labelsep=0mm,itemsep=0mm,labelwidth=2.0em,itemindent=2.0em,align=left,label={\sffamily\bfseries\color{ListColor}\arabic*.}}%
\else%
\ifnum#3=2%
\setlist[enumerate]{leftmargin=1.0em,labelsep=0mm,itemsep=0mm,labelwidth=1.5em,itemindent=1.5em,align=left,label={\sffamily\bfseries\color{ListColor}\alph*.}}%
\else%
\ClassError{textbook-cn}{The level of the QuestionItem environment is only 1 or 2!}{}%
\fi\fi%
\ifnum#1=1%
\begin{enumerate}[#2]%
\setcounter{enumi}{\value{@temp@item}}%
\else%
\begin{multicols}{#1}%
\begin{enumerate}[#2]%
\setcounter{enumi}{\value{@temp@item}}%
\fi%
}{%
\ifnum#1=1%
\setcounter{@temp@item}{\value{enumi}}%
\end{enumerate}%
\else%
\setcounter{@temp@item}{\value{enumi}}%
\end{enumerate}%
\end{multicols}%
\fi}

%%题目难度星级%%
\NewDocumentCommand{\score}{m O{5}}{%
\tikz[baseline]{%
\pgfmathsetmacro\pgfxa{1+#1}%
\tikzstyle{scorestars}=[star,star points=5,star point ratio=2.25,draw=ColorA,line width=0.045em,rounded corners=0.1em,inner sep=0.15em,anchor=outer point 3]%
\foreach \i in {1,...,#2}{%
\pgfmathparse{\i<=#1 ? "ColorA" : "white"}
\edef\starcolor{\pgfmathresult}
\draw(\i*1.0em,0)node[name=star\i,scorestars,fill=\starcolor]{};}
\pgfmathparse{#1>int(#1) ? int(1+#1) : 0}
\let\partstar=\pgfmathresult
\ifnum\partstar>0
\pgfmathsetmacro\starpart{#1-(int(#1)}
\path[clip]($(star\partstar.outer point 3)!(star\partstar.outer point 2)!(star\partstar.outer point 4)$)rectangle($(star\partstar.outer point 2 |- star\partstar.outer point 1)!\starpart!(star\partstar.outer point 1 -| star\partstar.outer point 5)$);
\fill(\partstar*1.0em,0)node[scorestars,fill=ColorA]{};
\fi}
}

%%设置答题卡%%
\NewDocumentCommand{\AnswerSheet}{+O{选择题答题区域} m m O{\linewidth} O{0.7cm}}{
\begin{flushleft}
\UnnumberedLabel~{\color{ColorA}\bfseries#1}\\
\vspace*{0.5em}
\begin{tikzpicture}[yscale=-1]
% 计算总高度
\pgfmathsetlengthmacro{\totalheight}{#2*#5}
% 绘制表格外框
\draw[ColorA,fill=ColorB!5,very thick,rounded corners](0,0)rectangle(#4,\totalheight);
% 绘制水平线
\ifnum#2=1\relax
\else
\foreach \row in {2,...,#2}{
\draw[ColorA,very thick](0,\row*#5-#5)--(#4,\row*#5-#5);
}
\fi
% 绘制垂直线
\ifnum#3=1\relax
\else
\foreach \col in {2,...,#3}{
\draw[ColorA,very thick](\col*#4/#3-#4/#3,0)--(\col*#4/#3-#4/#3,\totalheight);}
\fi
% 添加题号
\foreach \row in {1,...,\numexpr#2\relax}{
\foreach \col in {1,...,\numexpr#3\relax}{
\FPeval\Num{round((\row+1)/2*\col:0)}
\ifthenelse{\isodd{\row}}{
\node[text=ColorA,font=\bfseries]at({(\col-0.5)*#4/#3},{(\row-0.5)*#5}){\Num};
}{\relax}
}}
\end{tikzpicture}
\end{flushleft}}
%%%%%%%%%%%%%%%%%% 页面样式 %%%%%%%%%%%%%%%%%%%%%%%%
%%定义部分总数（序言、前言视作一个部分，目录、插图目录、表格目录视作一个部分，绪论、有编号部分、无编号部分以及后记）,编译两次可以得到正确的页面框架%%
\AtBeginDocument{%
\pagestyle{empty}%默认页面样式为空
\markboth{\protect\@subtitle}{\protect\@subtitle}%默认页眉标记
\extramarks{\protect\@seriesname}{\protect\@seriesname}%默认页面底部标记
\MainFont%默认正文字体
\raggedbottom%确保每一页的第一行文字均紧贴版心顶端
}
%%修改文档类中的各类标题、标签%%
\newcommand{\partlabelfront}{第}
\newcommand{\partlabelback}{部分}
\newcommand{\chapterlabelfront}{第}
\newcommand{\chapterlabelback}{章}
\newcommand{\sectionlabelfront}{第}
\newcommand{\sectionlabelback}{节}
\newcommand{\subsectionlabelfront}{课时}
\newcommand{\subsectionlabelback}{}
\newcommand{\subsubsectionlabelfront}{知识点}
\newcommand{\subsubsectionlabelback}{}
\newcommand{\exercisetitle}{课后习题}
\newcommand{\thinkingtitle}{思考题}
\newcommand{\improvetitle}{复习与提高}
\newcommand{\basictitle}{基础巩固}
\newcommand{\complextitle}{综合提升}
\newcommand{\timetext}{用时：}
\newcommand{\notetitle}{笔记区域}
\newcommand{\listeningtitle}{听力模块}
\newcommand{\readingtitle}{阅读模块}
\newcommand{\speakingtitle}{口语模块}
\newcommand{\writingtitle}{写作模块}
\newcommand{\homeworktitle}{作业习题}
\newcommand{\answertitle}{解答}
\newcommand{\analysistitle}{解析}
\newcommand{\exampletitle}{例题}
\newcommand{\varianttitle}{变式}
\newcommand{\chapterpointtitle}{本章要点}
\newcommand{\sectionpointtitle}{本节导言}
\newcommand{\concepttitle}{基础概念、公式和定理}
\newcommand{\outlinetitle}{本节提要}
\newcommand{\warningtitle}{易错点警示}
\newcommand{\discussiontitle}{思考与讨论}
\newcommand{\checktitle}{随堂练习}
\newcommand{\displaytitle}{演示与实验}
\newcommand{\methodtitle}{方法与技巧}
\newcommand{\mindtitle}{科学思维}
\newcommand{\definitiontitle}{定义}
\newcommand{\theoremtitle}{定理}
\newcommand{\axiomtitle}{公理}
\newcommand{\lemmatitle}{引理}
\newcommand{\corollarytitle}{推论}
\newcommand{\propositiontitle}{命题}
\newcommand{\linktitle}{拓展链接}
\newcommand{\historytitle}{科学发展史}
\newcommand{\ststitle}{科学·技术·社会}
\newcommand{\informationtitle}{资料卡片}
\newcommand{\applicationtitle}{案例分析}
\newcommand{\reviewtitle}{知识回顾}
\newcommand{\prooftitle}{证明}
\newcommand{\solutiontitle}{参考答案}
\newcommand{\summarytitle}{要点总结}
\newcommand{\comprehensiontitle}{阅读理解}
\newcommand{\clozetitle}{完形填空}
\newcommand{\articletitle}{文本解读}
\newcommand{\vocabularytitle}{词汇解析}
\newcommand{\codetitle}{代码示例}
\newcommand{\relainfotitle}{相关信息}
\newcommand{\deepthinktitle}{深入思考}
\newcommand{\remarktitle}{重点注释}
%%
\renewcommand{\headrulewidth}{0pt}
%%
\RenewDocumentCommand{\chaptermark}{+m}{%
\if@mainmatter%
\markboth{\chapterlabelfront{\sffamily\thechapter}\chapterlabelback\quad#1}{\chapterlabelfront{\sffamily\thechapter}\chapterlabelback\quad#1}
\else
\markboth{#1}{#1}
\fi}
%%
\RenewDocumentCommand{\sectionmark}{+m}{\markright{\sectionlabelfront{\sffamily\thesection}\sectionlabelback\quad#1}}
%%%%
%%绘制主页面样式%%
%%页面边框宽度
\newlength{\@FrameWidth}
\setlength{\@FrameWidth}{1.0cm+\@ExtraWidth}
%%声明装订线布尔变量%%
\newif\if@Gutter
\@Gutterfalse
%%
\newcommand{\AddGutter}{\@Guttertrue}%添加装订线
\newcommand{\RemoveGutter}{\@Gutterfalse}%移除装订线
%%%%
\newcommand{\@Main@PageStyle}{%
\begin{tikzpicture}[remember picture,overlay]%
\newdimen\@GutterWidth%
\newdimen\@PageNumHeight%
\newdimen\@PageNumWidth%
\newdimen\@DefaultTextwidth%
\newdimen\@ThumbStartHeight%
\newdimen\@ThumbRangeHeight%
\newdimen\@ChapterPercentLength%
%%
\@GutterWidth=\dimexpr\@FrameWidth+\@innerlen-\@outerlen\relax
\@PageNumHeight=\dimexpr\@ExtraWidth+\@toplen-\headsep+1.5mm\relax%
\@PageNumWidth=\dimexpr\@ExtraWidth+\@outerlen-\@FrameWidth-2.0mm\relax%
\@DefaultTextwidth=\dimexpr\paperwidth-\@innerlen-\@outerlen\relax%
\@ThumbStartHeight=\dimexpr\@ExtraWidth+6.0cm\relax%
\@ThumbRangeHeight=\dimexpr\paperheight-2\@ThumbStartHeight\relax%
%%侧标位置更新%%
\ifnum\totvalue{@Chapter@Number}=0
\@ChapterPercentLength=\dimeval{\paperheight/2}
\else
\ifnum\totvalue{@Chapter@Number}=1
\@ChapterPercentLength=\dimeval{\paperheight/2}
\else
\ifnum\value{@Chapter@Number}=0
\@ChapterPercentLength=\@ThumbStartHeight
\else
\def\@ChapterPercent{\fpeval{(\value{@Chapter@Number}-1)/(\totvalue{@Chapter@Number}-1)}}
\@ChapterPercentLength=\dimeval{\@ThumbStartHeight+\@ChapterPercent\@ThumbRangeHeight}
\fi\fi\fi
%%
\pgfdeclarelayer{@MainPage@Top}%
\pgfsetlayers{main,@MainPage@Top}%
%%根据页数的奇偶生成%%
\ifodd\value{page}
\coordinate(A)at([xshift=-\@ExtraWidth,yshift=\@ExtraWidth]current page.north west);
\coordinate(B)at([xshift=\@ExtraWidth,yshift=\@ExtraWidth]current page.north east);
\coordinate(C)at([xshift=\@ExtraWidth,yshift=-\@ExtraWidth]current page.south east);
\coordinate(D)at([xshift=-\@ExtraWidth,yshift=-\@ExtraWidth]current page.south west);
\coordinate(E)at([xshift=\@GutterWidth,yshift=\@FrameWidth]D);
\coordinate(F)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(G)at([xshift=-\@FrameWidth,yshift=-\@FrameWidth]B);
\coordinate(H)at([xshift=\@GutterWidth,yshift=-\@FrameWidth]A);
\coordinate(I)at(current page.south);
%%绘制页面框架%%
\path[fill=ColorB!7.5,even odd rule,sharp corners]
(A)--(B)--(C)--(D)--cycle
(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)[sharp corners]--cycle;
%%绘制页码%%
\path[preaction={fill=ColorA!60!ColorB},pattern={Lines[angle=45,distance=5.0pt,line width=4.0pt]},pattern color=ColorA]
([xshift=-\@ExtraWidth-\@outerlen+0.35cm]B)[rounded corners=1.5mm]--
([xshift=-\@ExtraWidth-\@outerlen+0.35cm,yshift=-\@PageNumHeight]B)[rounded corners=1.5mm]--
([xshift=-\@FrameWidth+0.15cm,yshift=-\@PageNumHeight]B)[sharp corners]--
([xshift=-\@FrameWidth+0.15cm]B)--cycle;
%%%%
\node[font=\PageNumberFont,text=white,anchor=south,inner ysep=2.5mm](P)at([xshift=-\@ExtraWidth/2-\@outerlen/2-\@FrameWidth/2+0.25cm,yshift=-\@PageNumHeight]B){\maxsizebox{\@PageNumWidth-4.0mm}{!}{\centering\thepage}};
%%绘制侧标%%
\begin{pgfonlayer}{@MainPage@Top}
\node[font=\ThumbFont,text=white,outer sep=0mm,inner xsep=2.5mm,inner ysep=3.5mm,anchor=east,minimum height=2.75cm](T)at([xshift=-0.1cm-\@ExtraWidth,yshift=-\@ChapterPercentLength]B){%
\rotatebox[origin=c]{90}{%
\begin{varwidth}{\@ThumbStartHeight}
\@change@minipage@footnote%
\centering\strut\@title\strut
\end{varwidth}}%
};
\end{pgfonlayer}
%%%%
\path[preaction={fill=ColorA!60!ColorB},pattern={Lines[angle=45,distance=5.0pt,line width=4.0pt]},pattern color=ColorA](T.north west)--([xshift=\@ExtraWidth+0.1cm]T.north east)--([xshift=\@ExtraWidth+0.1cm]T.south east)[rounded corners=1.75mm]--(T.south west)[rounded corners=1.75mm]--cycle;
%%%%
%%绘制部分序号标签%%
\begin{pgfonlayer}{@MainPage@Top}
\node[font=\PartNumberFont,text=white,outer sep=0mm,inner xsep=3.5mm,inner ysep=2.5mm,anchor=south,minimum width=2.75cm](PTN)at([yshift=0.1cm]I){%
\begin{varwidth}{\@DefaultTextwidth/3}%
\@change@minipage@footnote%
\centering\strut\firstrightxmark\strut%
\end{varwidth}};
\end{pgfonlayer}
%%%%
\path[preaction={fill=ColorA!60!ColorB},pattern={Lines[angle=45,distance=5.0pt,line width=4.0pt]},pattern color=ColorA]([yshift=-\@ExtraWidth-0.1cm]PTN.south west)[rounded corners=2.0mm]--(PTN.north west)[rounded corners=2.0mm]--(PTN.north east)[sharp corners]--([yshift=-\@ExtraWidth-0.1cm]PTN.south east)--cycle;
%%%%
\if@Gutter
%%绘制装订线%%
\def\@CircleNumber{6}%圆的数量
\def\@CircleRadius{2.5mm}%圆半径
%计算垂直方向的均匀间距
\newdimen\@CircleSep
\@CircleSep=\dimeval{(\paperheight-\@toplen-\@botlen)/(\@CircleNumber-1)}
%%
\foreach \i in {1,...,\@CircleNumber}{%
\fill[ColorB!15]([xshift=\@GutterWidth/2,yshift=-\@toplen-(\i-1)*\@CircleSep]current page.north west)circle(\@CircleRadius);}
\fi
%%%%
\else
\coordinate(A)at([xshift=\@ExtraWidth,yshift=\@ExtraWidth]current page.north east);
\coordinate(B)at([xshift=-\@ExtraWidth,yshift=\@ExtraWidth]current page.north west);
\coordinate(C)at([xshift=-\@ExtraWidth,yshift=-\@ExtraWidth]current page.south west);
\coordinate(D)at([xshift=\@ExtraWidth,yshift=-\@ExtraWidth]current page.south east);
\coordinate(E)at([xshift=-\@GutterWidth,yshift=\@FrameWidth]D);
\coordinate(F)at([xshift=\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(G)at([xshift=\@FrameWidth,yshift=-\@FrameWidth]B);
\coordinate(H)at([xshift=-\@GutterWidth,yshift=-\@FrameWidth]A);
\coordinate(I)at(current page.south);
%%绘制页面框架%%
\path[fill=ColorB!7.5,even odd rule,sharp corners]
(A)--(B)--(C)--(D)--cycle
(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)[sharp corners]--cycle;
%%绘制页码%%
\path[preaction={fill=ColorA!60!ColorB},pattern={Lines[angle=-45,distance=5.0pt,line width=4.0pt]},pattern color=ColorA]
([xshift=\@ExtraWidth+\@outerlen-0.35cm]B)[rounded corners=1.5mm]--
([xshift=\@ExtraWidth+\@outerlen-0.35cm,yshift=-\@PageNumHeight]B)[rounded corners=1.5mm]--
([xshift=\@FrameWidth-0.15cm,yshift=-\@PageNumHeight]B)[sharp corners]--
([xshift=\@FrameWidth-0.15cm]B)--cycle;
%%%%
\node[font=\PageNumberFont,text=white,anchor=south,inner ysep=2.5mm](P)at([xshift=\@ExtraWidth/2+\@FrameWidth/2+\@outerlen/2-0.25cm,yshift=-\@PageNumHeight]B){\maxsizebox{\@PageNumWidth-4.0mm}{!}{\centering\thepage}};
%%绘制侧标%%
\begin{pgfonlayer}{@MainPage@Top}
\node[font=\ThumbFont,text=white,outer sep=0mm,inner xsep=2.5mm,inner ysep=3.5mm,anchor=west,minimum height=2.75cm](T)at([xshift=0.1cm+\@ExtraWidth,yshift=-\@ChapterPercentLength]B){%
\rotatebox[origin=c]{-90}{%
\begin{varwidth}{\@ThumbStartHeight}
\@change@minipage@footnote%
\centering\strut\@title\strut
\end{varwidth}}%
};
\end{pgfonlayer}
%%%%
\path[preaction={fill=ColorA!60!ColorB},pattern={Lines[angle=-45,distance=5.0pt,line width=4.0pt]},pattern color=ColorA]([xshift=-\@ExtraWidth-0.1cm]T.north west)[rounded corners=1.75mm]--(T.north east)[rounded corners=1.75mm]--(T.south east)[sharp corners]--([xshift=-\@ExtraWidth-0.1cm]T.south west)--cycle;
%%%%
%%绘制部分序号标签%%
\begin{pgfonlayer}{@MainPage@Top}
\node[font=\PartNumberFont,text=white,outer sep=0mm,inner xsep=3.5mm,inner ysep=2.5mm,anchor=south,minimum width=2.75cm](PTN)at([yshift=0.1cm]I){%
\begin{varwidth}{\@DefaultTextwidth/3}%
\@change@minipage@footnote%
\centering\strut\firstrightxmark\strut%
\end{varwidth}};
\end{pgfonlayer}
%%%%
\path[preaction={fill=ColorA!60!ColorB},pattern={Lines[angle=-45,distance=5.0pt,line width=4.0pt]},pattern color=ColorA]([yshift=-\@ExtraWidth-0.1cm]PTN.south west)[rounded corners=2.0mm]--(PTN.north west)[rounded corners=2.0mm]--(PTN.north east)[sharp corners]--([yshift=-\@ExtraWidth-0.1cm]PTN.south east)--cycle;
%%%%
\if@Gutter
%%绘制装订线%%
\def\@CircleNumber{6}%圆的数量
\def\@CircleRadius{2.5mm}%圆半径
%计算垂直方向的均匀间距
\newdimen\@CircleSep
\@CircleSep=\dimeval{(\paperheight-\@toplen-\@botlen)/(\@CircleNumber-1)}
%%
\foreach \i in {1,...,\@CircleNumber}{%
\fill[ColorB!15]([xshift=-\@GutterWidth/2,yshift=-\@toplen-(\i-1)*\@CircleSep]current page.north east)circle(\@CircleRadius);}
\fi
\fi
\end{tikzpicture}%
}
%%
%%定义主页面样式%%
\fancypagestyle{MainPage}{%
\fancyhf{}%
\fancyfoot[C]{\@Main@PageStyle}%
\fancyhead[RO]{\HeaderFont\color{ColorA}\rightmark}%
\fancyhead[LE]{\HeaderFont\color{ColorA}\leftmark}}

%%防伪水印%%
\newcommand{\Medal}{%
\tikz[scale=2.25,opaque]{%
\begingroup%
%参数
\newdimen\@StripeHalfWidth
\newdimen\@StripeHalfHeight
\newdimen\@NotchDepth
%%
\@StripeHalfWidth=1.25cm
\@StripeHalfHeight=4.5cm
\@NotchDepth=0.75cm
%%
\fill[ColorB!50]
(-\@StripeHalfWidth,\@StripeHalfHeight)[rounded corners=2.5mm]--(0,\@StripeHalfHeight-\@NotchDepth)[rounded corners=5.0mm]--(\@StripeHalfWidth,\@StripeHalfHeight)--(\@StripeHalfWidth,-\@StripeHalfHeight)[rounded corners=2.5mm]--(0,-\@StripeHalfHeight+\@NotchDepth)[rounded corners=5.0mm]--(-\@StripeHalfWidth,-\@StripeHalfHeight)--cycle;
%参数定义
\newdimen\@CoilCircleBRadius
\newdimen\@CoilCircleSRadius
\newdimen\@Amplitude
\@CoilCircleBRadius=3.15cm
\@CoilCircleSRadius=2.95cm
\@Amplitude=0.1cm
\def\@WaveNumber{20}%波浪数量
%%
%外圈
\fill[ColorB!50,draw=ColorB!7.5,line width=2.5mm]
plot[smooth,domain=0:360,samples=360,variable=\t]
({(\@CoilCircleBRadius+\@Amplitude+\@Amplitude*sin(\@WaveNumber*\t-90))*cos(\t)},%
{(\@CoilCircleBRadius+\@Amplitude+\@Amplitude*sin(\@WaveNumber*\t-90))*sin(\t)})--cycle;
%内圈
\fill[ColorB!7.5](0,0)circle(\@CoilCircleSRadius);
%%%%
\newdimen\@TempRad
\@TempRad=2.8cm
\draw[ColorB!50,line width=2.5pt](0,0)circle(\@TempRad);
\@TempRad=2.7cm
\draw[ColorB!50,line width=2.5pt,loosely dotted,line cap=round](0,0)circle(\@TempRad);
\@TempRad=2.6cm
\draw[ColorB!50,line width=2.5pt](0,0)circle(\@TempRad);
%%%%
\newdimen\@ArrowSep
\newdimen\@ArrowCircleRadius
\def\@ArrowNumber{21}
\@ArrowCircleRadius=2.4cm
\@ArrowSep=\dimeval{6.283185307\@ArrowCircleRadius/(\@ArrowNumber-1)}
%%
\draw[decorate,draw=none,fill=ColorB!50,rounded corners=0.5mm,decoration={shape backgrounds,shape width=8.0mm,shape height=4.5mm,shape=signal,shape sep=\@ArrowSep},
signal from=west,signal to=east](0,0)circle(\@ArrowCircleRadius);
%%%%
\@TempRad=2.2cm
\draw[ColorB!50,line width=2.5pt](0,0)circle(\@TempRad);
\newdimen\@FilledCircleRadius
\@FilledCircleRadius=2.0cm
\fill[ColorB!50](0,0)circle(\@FilledCircleRadius);
%%%%
\newdimen\@TextCircleRadius
\@TextCircleRadius=1.45cm
\def\theta{180}
\path[postaction={%
decoration={%
text along path,%
text format delimiters={[}{]},%
text={[\bfseries\sffamily\FontSizeSet{28}]APPROVED TEXTBOOK},%
text color=ColorB!7.5,%
text align={fit to path stretching spaces}%
},decorate}]({cos(\theta)*\@TextCircleRadius},{sin(\theta)*\@TextCircleRadius})arc(\theta:{180-\theta}:\@TextCircleRadius);
%%%%
\node[inner sep=0mm,outer sep=0mm,font=\FontSizeSet{100},text=ColorB!7.5](L)at(0,0){\faBookOpen};
%%%%
\node[inner sep=0mm,outer sep=0mm,font={\bfseries\sffamily\FontSizeSet[1.0]{20}},text=ColorB!7.5,anchor=north,align=center,text width=6.0cm](T)at([yshift=-2.5mm]L.south){ALL RIGHTS RESERVED};
\endgroup}}
%%
\newcommand{\@Part@PageStyle}{%
\begin{tikzpicture}[remember picture,overlay]
\path[fill=ColorB!7.5]([xshift=-\@ExtraWidth,yshift=-\@ExtraWidth]current page.south west)rectangle([xshift=\@ExtraWidth,yshift=\@ExtraWidth]current page.north east);
\node at(current page.center){\Clover[ColorB!15][0.5]};
\end{tikzpicture}}
%%
%%定义部分页面样式%%
\fancypagestyle{PartPage}{%
\fancyhf{}%清除所有页眉页脚
\fancyfoot[C]{\@Part@PageStyle}%
}
%%%%
\newcommand{\@Chapter@PageStyle}{%
%%如果文档中包含部分层次且部分数大于0则添加章节页侧标%%
\ifnum\totvalue{@Part@Number}>0
\newdimen\@Chap@PartIndex@Ht
\newdimen\@Chap@PartIndex@XShift
\newdimen\@Chap@PartIndex@Sep
\@Chap@PartIndex@Ht=2.75cm
%%%%
%%一页最多可以容纳的侧标数目%%
\pgfmathsetmacro{\totalnumber}{int((\paperheight-\@toplen-\@botlen-\@ChapterPage@TopCut-\@ChapterPage@BottomCut)/\@Chap@PartIndex@Ht)}
%%考虑没有部分层次的位置（比如前言位置）的情况%%
\ifnum\value{@Part@Number}<1
\pgfmathsetmacro{\tempn}{0}
\else
\pgfmathsetmacro{\tempn}{floor((\value{@Part@Number}-1)/\totalnumber)}
\fi
%%一页中第一个侧标的序号%%
\pgfmathsetmacro{\beginnum}{int(\totalnumber*\tempn+1)}
%%一页中最后一个侧标的序号%%
\ifnum\numexpr\totvalue{@Part@Number}-\beginnum\relax<\numexpr\totalnumber-1\relax
\pgfmathsetmacro{\endnum}{int(\totvalue{@Part@Number})}
\else
\pgfmathsetmacro{\endnum}{int(\beginnum+\totalnumber-1)}
\fi
%%%%
\begin{tikzpicture}[remember picture,overlay]
\ifodd\value{page}
\coordinate(S0)at([yshift=-\@toplen-\@ChapterPage@TopCut]current page.north east);
%%%%
\foreach \i in {\beginnum,...,\endnum}{%
%%颜色设置%%
\@Chap@PartIndex@XShift=0cm
\colorlet{PartIndexDrawColor}{ColorB!22.5}
\colorlet{PartIndexFillColor}{ColorB!7.5}
\colorlet{PartIndexTextColor}{ColorB!22.5}
%%判断是否“部分终止”，如果是，则不改变侧标的颜色和尺寸%%
\if@PartStop
\relax
\else
%%当循环到当前章节所在部分序数时，对侧标颜色等进行设置%%
\ifnum\i=\value{@Part@Number}
\@Chap@PartIndex@XShift=0.15cm
\colorlet{PartIndexDrawColor}{ColorA}
\colorlet{PartIndexFillColor}{ColorA}
\colorlet{PartIndexTextColor}{white}
\fi\fi
%%%%
%%从aux文件中读取部分名称%%
\ifcsname partname@\i\endcsname%
\def\@Chap@PartThumb{\csname partname@\i\endcsname}%
\else%
\def\@Chap@PartThumb{}%
\fi
%%%%
\ifnum\i=\beginnum
\coordinate(SP)at(S0);
\fi
%%
\path[fill=PartIndexFillColor,draw=none]node[append after command={([xshift=\@ExtraWidth]S\i.south east)[rounded corners=2.0mm]--(S\i.north east)--(S\i.north west)[sharp corners]--([xshift=\@ExtraWidth]S\i.south west)--cycle},anchor=south east,font=\ThumbFont,text=PartIndexTextColor,inner xsep=2.0mm,inner ysep=3.0mm,outer sep=0mm,text width=\@Chap@PartIndex@Ht-4.0mm,rotate=90](S\i)at(SP){\parbox{\@Chap@PartIndex@Ht-4.0mm}{\centering\strut\@Chap@PartThumb\strut}\vspace*{\@Chap@PartIndex@XShift}};
\draw[PartIndexDrawColor,ultra thick]([xshift=\@ExtraWidth]S\i.south east)[rounded corners=2.0mm]--(S\i.north east)--(S\i.north west)[sharp corners]--([xshift=\@ExtraWidth]S\i.south west);
%%
%%若本次循环的序数比部分序数少1或等于部分序数，则对纵向偏移量进行微调%%
\if@PartStop
\@Chap@PartIndex@Sep=0pt
\else
\ifnum\i=\numexpr\value{@Part@Number}-1\relax
\@Chap@PartIndex@Sep=1.6pt
\else
\ifnum\i=\value{@Part@Number}
\@Chap@PartIndex@Sep=1.6pt
\else
\@Chap@PartIndex@Sep=0pt
\fi\fi
\fi
%%
\coordinate(SP)at([yshift=-\@Chap@PartIndex@Sep]S\i.south west);}
\else
\coordinate(S0)at([yshift=-\@toplen-\@ChapterPage@TopCut]current page.north west);
%%%%
\foreach \i in {\beginnum,...,\endnum}{%
%%颜色设置%%
\@Chap@PartIndex@XShift=0cm
\colorlet{PartIndexDrawColor}{ColorB!22.5}
\colorlet{PartIndexFillColor}{ColorB!7.5}
\colorlet{PartIndexTextColor}{ColorB!22.5}
%%判断是否“部分终止”，如果是，则不改变侧标的颜色和尺寸%%
\if@PartStop
\relax
\else
%%当循环到当前章节所在部分序数时，对侧标颜色等进行设置%%
\ifnum\i=\value{@Part@Number}
\@Chap@PartIndex@XShift=0.15cm
\colorlet{PartIndexDrawColor}{ColorA}
\colorlet{PartIndexFillColor}{ColorA}
\colorlet{PartIndexTextColor}{white}
\fi\fi
%%%%
%%从aux文件中读取部分名称%%
\ifcsname partname@\i\endcsname%
\def\@Chap@PartThumb{\csname partname@\i\endcsname}%
\else%
\def\@Chap@PartThumb{}%
\fi
%%%%
\ifnum\i=\beginnum
\coordinate(SP)at(S0);
\fi
%%
\path[fill=PartIndexFillColor,draw=none]node[append after command={([xshift=-\@ExtraWidth]S\i.south west)[rounded corners=2.0mm]--(S\i.north west)--(S\i.north east)[sharp corners]--([xshift=-\@ExtraWidth]S\i.south east)--cycle},anchor=south west,font=\ThumbFont,text=PartIndexTextColor,inner xsep=2.0mm,inner ysep=3.0mm,outer sep=0mm,text width=\@Chap@PartIndex@Ht-4.0mm,rotate=270](S\i)at(SP){\parbox{\@Chap@PartIndex@Ht-4.0mm}{\centering\strut\@Chap@PartThumb\strut}\vspace*{\@Chap@PartIndex@XShift}};
\draw[PartIndexDrawColor,ultra thick]([xshift=-\@ExtraWidth]S\i.south west)[rounded corners=2.0mm]--(S\i.north west)--(S\i.north east)[sharp corners]--([xshift=-\@ExtraWidth]S\i.south east);
%%
%%若本次循环的序数比部分序数少1或等于部分序数，则对纵向偏移量进行微调%%
\if@PartStop
\@Chap@PartIndex@Sep=0pt
\else
\ifnum\i=\numexpr\value{@Part@Number}-1\relax
\@Chap@PartIndex@Sep=1.6pt
\else
\ifnum\i=\value{@Part@Number}
\@Chap@PartIndex@Sep=1.6pt
\else
\@Chap@PartIndex@Sep=0pt
\fi\fi
\fi
%%
\coordinate(SP)at([yshift=-\@Chap@PartIndex@Sep]S\i.south east);}
\fi
\end{tikzpicture}
\fi}
%%
%%定义章页面样式%%
\fancypagestyle{ChapterPage}{%
\fancyhf{}%清除所有页眉页脚
\fancyfoot[C]{\@Chapter@PageStyle}%
}

%%%%%%%%%%%%%%%%%%%% 书籍层次样式 %%%%%%%%%%%%%%%%%%%%%%
%%部分页样式%%
%%编号部分页样式%%
%%部分介绍%%
\newcommand{\partintro}[1]{\long\def\@partintro{\hspace*{2.0em}#1}}
\newcommand{\partimage}[1]{\long\def\@partimage{#1}}
\newcommand{\partsubtitle}[1]{\long\def\@partsubtitle{#1}}
\partintro{}
\partimage{}
\partsubtitle{}
%%
%%奇数页布局%%
\NewDocumentCommand{\@Part@OddPage@Style}{ +m +m }{%
\begin{pgfonlayer}{@Part@Top}
%%右上角色块坐标%%
\coordinate(A)at([xshift=\@ExtraWidth,yshift=\@ExtraWidth]current page.north east);
\coordinate(B)at([xshift=-\@Part@BlockWidth-\@ExtraWidth]A);
\coordinate(C)at([xshift=-\@Part@BlockWidth-\@ExtraWidth,yshift=-\@Part@TopOuterBlockLength-\@ExtraWidth]A);
\coordinate(D)at([yshift=-\@Part@TopOuterBlockLength-\@ExtraWidth]A);
%%右上角色块%%
\path[fill=ColorA,opacity=\@ColorBlock@Opacity](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=-\@Part@MiddleOuterBlockLength-\@ExtraWidth]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=-\@Part@MiddleOuterBlockLength-\@ExtraWidth]T);
%%右侧色块%%
\path[fill=ColorB!75,opacity=\@ColorBlock@Opacity](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=-\@Part@BlockWidth-\@ExtraWidth]E);
\coordinate(H)at([xshift=\@ExtraWidth,yshift=-\@ExtraWidth]current page.south east);
\coordinate(G)at([xshift=-\@Part@BlockWidth-\@ExtraWidth]H);
%%右下角色块%%
\path[fill=ColorA,opacity=\@ColorBlock@Opacity](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
\end{pgfonlayer}
%%%%
%%左上角色块坐标%%
\coordinate(I)at([xshift=-\@Part@StripeWidth]B);
\coordinate(J)at([xshift=-\@ExtraWidth,yshift=\@ExtraWidth]current page.north west);
\coordinate(K)at([yshift=-\@Part@TopOuterBlockLength-\@ExtraWidth]J);
\coordinate(L)at([xshift=-\@Part@StripeWidth]C);
%%%%
%%左下角色块坐标%%
\coordinate(M)at([xshift=-\@Part@StripeWidth]F);
\coordinate(N)at([xshift=-\paperwidth-2\@ExtraWidth]E);
\coordinate(O)at([xshift=-\@ExtraWidth,yshift=-\@ExtraWidth]current page.south west);
\coordinate(P)at([xshift=-\@Part@StripeWidth]G);
%%%%
%%背景颜色%%
\fill[ColorB!7.5](A)rectangle(O);
%%章节图片%%
%%裁剪超出页面范围的图片%%
\clip(A)rectangle(O);
\node[anchor=south west,outer sep=0mm,inner sep=0mm](Pic)at(O){\@partimage};
%%如果\@partimage不为空则添加白色透明蒙版%%
\expandafter\ifblank\expandafter{\@partimage}{\relax}{%
\fill[white,opacity=0.5](A)rectangle(O);}
%%白色边框%%
\fill[white,opacity=\@WhiteLine@Opacity](A)--(I)[rounded corners=2.5mm]--(L)[sharp corners]--(K)--(N)[rounded corners=2.5mm]--(M)[sharp corners]--(P)--(H)--cycle;
%%%%
\begin{pgfonlayer}{@Part@Top}
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=-\@Part@StripeWidth]R);
\coordinate(X)at([xshift=-\@Part@StripeWidth]S);
%%部分编号%%
\node[align=flush right,anchor=south east,font=\PartLabelFont,text=ColorA,inner xsep=0mm](NL)at([yshift=\@Part@StripeWidth+0.25cm]U){%
\begin{varwidth}{\@DefaultTextwidth-5.0cm}%
\@change@minipage@footnote%
\strut#1\strut
\end{varwidth}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(NL)\NLWidth
\coordinate(V)at([xshift=-\NLWidth]U);
\coordinate(W)at([xshift=-\NLWidth]X);
%%
%%页面中部色块%%
\path[fill=ColorB,rounded corners=2.5mm,opacity=\@ColorBlock@Opacity](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=-\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=-\@Part@StripeWidth]W);
%%左侧色块%%
\path[fill=ColorB!75,opacity=\@ColorBlock@Opacity](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%部分名%%
\node[align=flush right,anchor=north east,font=\PartNameFont,text=ColorA,inner xsep=0mm](PT)at([yshift=-\@Part@StripeWidth-0.25cm]X){%
\begin{varwidth}{\@DefaultTextwidth-2.45cm}%
\@change@minipage@footnote%
\strut#2\strut
\end{varwidth}};
%%部分简介%%
\node[align=flush right,anchor=north east,font=\itshape\kaiti,text=ColorA,inner xsep=0mm](IT)at([yshift=-0.5cm]PT.south east){%
\begin{varwidth}{\@DefaultTextwidth-2.45cm}%
\@change@minipage@footnote%
\@partintro
\end{varwidth}};
%%部分目录%%
\node[inner sep=0mm,outer sep=0mm,anchor=south west](SC)at([xshift=\@ExtraWidth+\@innerlen+2.5mm,yshift=\@ExtraWidth+\@botlen]O){%
\parbox{\@DefaultTextwidth-2.45cm}{%
\begin{multicols}{3}
\begingroup%
\@erase@marginpar%
\@erase@marginnote%
\printcontents[parts]{l}{0}[0]{\def\@pnumwidth{0pt}}%
\endgroup%
\end{multicols}}
};
\end{pgfonlayer}}
%%
%%偶数页布局%%
\NewDocumentCommand{\@Part@EvenPage@Style}{ +m +m }{%
\begin{pgfonlayer}{@Part@Top}
%%左上角色块坐标%%
\coordinate(A)at([xshift=-\@ExtraWidth,yshift=\@ExtraWidth]current page.north west);
\coordinate(B)at([xshift=\@Part@BlockWidth+\@ExtraWidth]A);
\coordinate(C)at([xshift=\@Part@BlockWidth+\@ExtraWidth,yshift=-\@Part@TopOuterBlockLength-\@ExtraWidth]A);
\coordinate(D)at([yshift=-\@Part@TopOuterBlockLength-\@ExtraWidth]A);
%%左上角色块%%
\path[fill=ColorA,opacity=\@ColorBlock@Opacity](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%左侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=\@Part@MiddleOuterBlockLength+\@ExtraWidth]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=\@Part@MiddleOuterBlockLength+\@ExtraWidth]T);
%%左侧色块%%
\path[fill=ColorB!75,opacity=\@ColorBlock@Opacity](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%左下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=\@Part@BlockWidth+\@ExtraWidth]E);
\coordinate(H)at([xshift=-\@ExtraWidth,yshift=-\@ExtraWidth]current page.south west);
\coordinate(G)at([xshift=\@Part@BlockWidth+\@ExtraWidth]H);
%%左下角色块%%
\path[fill=ColorA,opacity=\@ColorBlock@Opacity](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
\end{pgfonlayer}
%%%%
%%右上角色块坐标%%
\coordinate(I)at([xshift=\@Part@StripeWidth]B);
\coordinate(J)at([xshift=\@ExtraWidth,yshift=\@ExtraWidth]current page.north east);
\coordinate(K)at([yshift=-\@Part@TopOuterBlockLength-\@ExtraWidth]J);
\coordinate(L)at([xshift=\@Part@StripeWidth]C);
%%右下角色块坐标%%
\coordinate(M)at([xshift=\@Part@StripeWidth]F);
\coordinate(N)at([xshift=\paperwidth+2\@ExtraWidth]E);
\coordinate(O)at([xshift=\@ExtraWidth,yshift=-\@ExtraWidth]current page.south east);
\coordinate(P)at([xshift=\@Part@StripeWidth]G);
%%%%
%%背景颜色%%
\fill[ColorB!7.5](A)rectangle(O);
%%章节图片%%
%%裁剪超出页面范围的图片%%
\clip(A)rectangle(O);
\node[anchor=south east,outer sep=0mm,inner sep=0mm](Pic)at(O){\@partimage};
%%如果\@partimage不为空则添加白色透明蒙版%%
\expandafter\ifblank\expandafter{\@partimage}{\relax}{%
\fill[white,opacity=0.5](A)rectangle(O);}
%%白色边框%%
\fill[white,opacity=\@WhiteLine@Opacity](A)--(I)[rounded corners=2.5mm]--(L)[sharp corners]--(K)--(N)[rounded corners=2.5mm]--(M)[sharp corners]--(P)--(H)--cycle;
%%%%
\begin{pgfonlayer}{@Part@Top}
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=\@Part@StripeWidth]R);
\coordinate(X)at([xshift=\@Part@StripeWidth]S);
%%部分编号%%
\node[align=flush left,anchor=south west,font=\PartLabelFont,text=ColorA,inner xsep=0mm](NL)at([yshift=\@Part@StripeWidth+0.25cm]U){%
\begin{varwidth}{\@DefaultTextwidth-5.0cm}%
\@change@minipage@footnote%
\strut#1\strut
\end{varwidth}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(NL)\NLWidth
\coordinate(V)at([xshift=\NLWidth]U);
\coordinate(W)at([xshift=\NLWidth]X);
%%
%%页面中部色块%%
\path[fill=ColorB,opacity=\@ColorBlock@Opacity,rounded corners=2.5mm](U)rectangle(W);
%%右侧色块坐标%%
\coordinate(Y)at([xshift=\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=\@Part@StripeWidth]W);
%%右侧色块%%
\path[fill=ColorB!75,opacity=\@ColorBlock@Opacity](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%
%%部分名%%
\node[align=flush left,anchor=north west,font=\PartNameFont,text=ColorA,inner xsep=0mm](PT)at([yshift=-\@Part@StripeWidth-0.25cm]X){%
\begin{varwidth}{\@DefaultTextwidth-2.45cm}%
\@change@minipage@footnote%
\strut#2\strut
\end{varwidth}};
%%部分简介%%
\node[align=flush left,anchor=north west,font=\itshape\kaiti,text=ColorA,inner xsep=0mm](IT)at([yshift=-0.5cm]PT.south west){%
\begin{varwidth}{\@DefaultTextwidth-2.45cm}%
\@change@minipage@footnote%
\@partintro
\end{varwidth}};
%%部分目录%%
\node[inner sep=0mm,outer sep=0mm,minimum width=4.0cm,anchor=south east](SC)at([xshift=-\@ExtraWidth-\@innerlen-2.5mm,yshift=\@ExtraWidth+\@botlen]O){%
\parbox{\@DefaultTextwidth-2.45cm}{%
\begin{multicols}{3}
\begingroup%
\@erase@marginpar%
\@erase@marginnote%
\printcontents[parts]{l}{0}[0]{\def\@pnumwidth{0pt}}%
\endgroup%
\end{multicols}}
};
\end{pgfonlayer}}
%%
\NewDocumentCommand{\@PartStyle}{ +m +m }{%
\begin{tikzpicture}[remember picture,overlay]
\newdimen\@Part@StripeWidth
\newdimen\@Part@BlockWidth
\newdimen\@Part@TopOuterBlockLength
\newdimen\@Part@MiddleOuterBlockLength
\newdimen\@DefaultTextwidth
%%
\@Part@StripeWidth=0.35cm
\@Part@BlockWidth=1.75cm
\@Part@TopOuterBlockLength=7.0cm
\@Part@MiddleOuterBlockLength=4.0cm
\@DefaultTextwidth=\dimexpr\paperwidth-\@innerlen-\@outerlen\relax
%%
\pgfdeclarelayer{@Part@Top}
\pgfdeclarelayer{@Part@Bottom}
\pgfsetlayers{@Part@Bottom,main,@Part@Top}
%%
%%要展开宏再进行非空判断%%
\expandafter\ifblank\expandafter{\@partimage}{%
\def\@ColorBlock@Opacity{1}%
\def\@WhiteLine@Opacity{1}%
}{%
\def\@ColorBlock@Opacity{0.9}%
\def\@WhiteLine@Opacity{0.3}%
}
%%
\ifodd\value{page}%判断奇偶页
\@Part@OddPage@Style{#1}{#2}
\else
\@Part@EvenPage@Style{#1}{#2}
\fi
\end{tikzpicture}}
%%
%%定义小半圆%%
\newcommand{\@HalfCircle@Label}[2]{%
\tikz{\path[fill=#1,sharp corners](0,0)arc(90:-90:#2)--cycle;}}
%%
%%奇数页布局%%
\NewDocumentCommand{\@Part@Star@OddPage@Style}{ +m }{%
\begin{pgfonlayer}{@Part@Star@Top}
%%右上角色块坐标%%
\coordinate(A)at([xshift=\@ExtraWidth,yshift=\@ExtraWidth]current page.north east);
\coordinate(B)at([xshift=-\@Part@BlockWidth-\@ExtraWidth]A);
\coordinate(C)at([xshift=-\@Part@BlockWidth-\@ExtraWidth,yshift=-\@Part@TopOuterBlockLength-\@ExtraWidth]A);
\coordinate(D)at([yshift=-\@Part@TopOuterBlockLength-\@ExtraWidth]A);
%%右上角色块%%
\path[fill=ColorA,opacity=\@ColorBlock@Opacity](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=-\@Part@MiddleOuterBlockLength-\@ExtraWidth]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=-\@Part@MiddleOuterBlockLength-\@ExtraWidth]T);
%%右侧色块%%
\path[fill=ColorB!75,opacity=\@ColorBlock@Opacity](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=-\@Part@BlockWidth-\@ExtraWidth]E);
\coordinate(H)at([xshift=\@ExtraWidth,yshift=-\@ExtraWidth]current page.south east);
\coordinate(G)at([xshift=-\@Part@BlockWidth-\@ExtraWidth]H);
%%右下角色块%%
\path[fill=ColorA,opacity=\@ColorBlock@Opacity](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
\end{pgfonlayer}
%%左上角色块坐标%%
\coordinate(I)at([xshift=-\@Part@StripeWidth]B);
\coordinate(J)at([xshift=-\@ExtraWidth,yshift=\@ExtraWidth]current page.north west);
\coordinate(K)at([yshift=-\@Part@TopOuterBlockLength-\@ExtraWidth]J);
\coordinate(L)at([xshift=-\@Part@StripeWidth]C);
%%左下角色块坐标%%
\coordinate(M)at([xshift=-\@Part@StripeWidth]F);
\coordinate(N)at([xshift=-\paperwidth-2\@ExtraWidth]E);
\coordinate(O)at([xshift=-\@ExtraWidth,yshift=-\@ExtraWidth]current page.south west);
\coordinate(P)at([xshift=-\@Part@StripeWidth]G);
%%%%
%%背景颜色%%
\fill[ColorB!7.5](A)rectangle(O);
%%章节图片%%
%%裁剪超出页面范围的图片%%
\clip(A)rectangle(O);
\node[anchor=south west,outer sep=0mm,inner sep=0mm](Pic)at(O){\@partimage};
%%如果\@partimage不为空则添加白色透明蒙版%%
\expandafter\ifblank\expandafter{\@partimage}{\relax}{%
\fill[white,opacity=0.5](A)rectangle(O);}
%%白色边框%%
\fill[white,opacity=\@WhiteLine@Opacity](A)--(I)[rounded corners=2.5mm]--(L)[sharp corners]--(K)--(N)[rounded corners=2.5mm]--(M)[sharp corners]--(P)--(H)--cycle;
%%%%
\begin{pgfonlayer}{@Part@Star@Top}%
\begingroup%
\PartNameFont%
\newdimen\@Part@Star@LabelRadius%
\newdimen\@Part@Star@LabelYShift%
%%
\@Part@Star@LabelRadius=\dimeval{0.75\baselineskip/2}%
\@Part@Star@LabelYShift=\dimeval{0.25\baselineskip/4}%
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=-\@Part@StripeWidth]R);
\coordinate(X)at([xshift=-\@Part@StripeWidth]S);
%%标题%%
\node[inner sep=0mm,anchor=south east](ZZ)at([yshift=\@Part@StripeWidth+5.0mm]U){%
\tikz{%
\node[inner sep=0mm,outer sep=0mm,anchor=south west](HC1){\@HalfCircle@Label{ColorA}{\@Part@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC2)at(HC1.east){\@HalfCircle@Label{ColorA!80}{\@Part@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC3)at(HC2.east){\@HalfCircle@Label{ColorA!60}{\@Part@Star@LabelRadius}};
\node[align=flush left,inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA,font=\PartNameFont](PST)at([xshift=0.5cm,yshift=\@Part@Star@LabelYShift]HC3.north east){%
\begin{varwidth}{\@DefaultTextwidth-5.0cm}
\@change@minipage@footnote%
\strut#1\strut
\end{varwidth}};}};
\endgroup%
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(ZZ)\ZZWidth
\coordinate(V)at([xshift=-\ZZWidth]U);
\coordinate(W)at([xshift=-\ZZWidth]X);
%%
%%页面中部色块%%
\path[fill=ColorB,opacity=\@ColorBlock@Opacity,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=-\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=-\@Part@StripeWidth]W);
%%左侧色块%%
\path[fill=ColorB!75,opacity=\@ColorBlock@Opacity](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%
%%部分副标题%%
\node[align=flush left,anchor=north east,font=\PartNameFont,text=ColorA,inner xsep=0mm](PSST)at([yshift=-\@Part@StripeWidth-0.25cm]X){%
\begin{varwidth}{\@DefaultTextwidth-2.45cm}%
\@change@minipage@footnote%
\expandafter\ifblank\expandafter{\@partsubtitle}{\relax}{\strut\@partsubtitle\strut}%要展开宏再进行非空判断
\end{varwidth}};
%%部分简介%%
\node[align=flush left,anchor=north east,font=\itshape\kaiti,text=ColorA,inner xsep=0mm](IT)at([yshift=-0.5cm]PSST.south east){%
\begin{varwidth}{\@DefaultTextwidth-2.45cm}%
\@change@minipage@footnote%
\@partintro
\end{varwidth}};
%%部分目录%%
\node[inner sep=0mm,outer sep=0mm,anchor=south west](SC)at([xshift=\@ExtraWidth+\@innerlen+2.5mm,yshift=\@ExtraWidth+\@botlen]O){%
\parbox{\@DefaultTextwidth-2.45cm}{%
\begin{multicols}{3}
\begingroup%
\@erase@marginpar%
\@erase@marginnote%
\printcontents[parts]{l}{0}[0]{\def\@pnumwidth{0pt}}%
\endgroup%
\end{multicols}}
};
\end{pgfonlayer}}
%%
%%偶数页布局%%
\NewDocumentCommand{\@Part@Star@EvenPage@Style}{ +m }{%
\begin{pgfonlayer}{@Part@Star@Top}
%%左上角色块坐标%%
\coordinate(A)at([xshift=-\@ExtraWidth,yshift=\@ExtraWidth]current page.north west);
\coordinate(B)at([xshift=\@Part@BlockWidth+\@ExtraWidth]A);
\coordinate(C)at([xshift=\@Part@BlockWidth+\@ExtraWidth,yshift=-\@Part@TopOuterBlockLength-\@ExtraWidth]A);
\coordinate(D)at([yshift=-\@Part@TopOuterBlockLength-\@ExtraWidth]A);
%%左上角色块%%
\path[fill=ColorA,opacity=\@ColorBlock@Opacity](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%左侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=\@Part@MiddleOuterBlockLength+\@ExtraWidth]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=\@Part@MiddleOuterBlockLength+\@ExtraWidth]T);
%%左侧色块%%
\path[fill=ColorB!75,opacity=\@ColorBlock@Opacity](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%左下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=\@Part@BlockWidth+\@ExtraWidth]E);
\coordinate(H)at([xshift=-\@ExtraWidth,yshift=-\@ExtraWidth]current page.south west);
\coordinate(G)at([xshift=\@Part@BlockWidth+\@ExtraWidth]H);
%%左下角色块%%
\path[fill=ColorA,opacity=\@ColorBlock@Opacity](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
\end{pgfonlayer}
%%右上角色块坐标%%
\coordinate(I)at([xshift=\@Part@StripeWidth]B);
\coordinate(J)at([xshift=\@ExtraWidth,yshift=\@ExtraWidth]current page.north east);
\coordinate(K)at([yshift=-\@Part@TopOuterBlockLength-\@ExtraWidth]J);
\coordinate(L)at([xshift=\@Part@StripeWidth]C);
%%右下角色块坐标%%
\coordinate(M)at([xshift=\@Part@StripeWidth]F);
\coordinate(N)at([xshift=\paperwidth+2\@ExtraWidth]E);
\coordinate(O)at([xshift=\@ExtraWidth,yshift=-\@ExtraWidth]current page.south east);
\coordinate(P)at([xshift=\@Part@StripeWidth]G);
%%%%
%%背景颜色%%
\fill[ColorB!7.5](A)rectangle(O);
%%章节图片%%
%%裁剪超出页面范围的图片%%
\clip(A)rectangle(O);
\node[anchor=south east,outer sep=0mm,inner sep=0mm](Pic)at(O){\@partimage};
%%如果\@partimage不为空则添加白色透明蒙版%%
\expandafter\ifblank\expandafter{\@partimage}{\relax}{%
\fill[white,opacity=0.5](A)rectangle(O);}
%%白色边框%%
\fill[white,opacity=\@WhiteLine@Opacity](A)--(I)[rounded corners=2.5mm]--(L)[sharp corners]--(K)--(N)[rounded corners=2.5mm]--(M)[sharp corners]--(P)--(H)--cycle;
%%%%
\begin{pgfonlayer}{@Part@Star@Top}%
\begingroup%
\PartNameFont%
\newdimen\@Part@Star@LabelRadius%
\newdimen\@Part@Star@LabelYShift
%%
\@Part@Star@LabelRadius=\dimeval{0.75\baselineskip/2}%
\@Part@Star@LabelYShift=\dimeval{0.25\baselineskip/4}%
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=\@Part@StripeWidth]R);
\coordinate(X)at([xshift=\@Part@StripeWidth]S);
%%标题%%
\node[inner sep=0mm,anchor=south west](ZZ)at([yshift=\@Part@StripeWidth+5.0mm]U){%
\tikz{%
\node[inner sep=0mm,outer sep=0mm,anchor=south west](HC1){\@HalfCircle@Label{ColorA}{\@Part@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC2)at(HC1.east){\@HalfCircle@Label{ColorA!80}{\@Part@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC3)at(HC2.east){\@HalfCircle@Label{ColorA!60}{\@Part@Star@LabelRadius}};
\node[align=flush left,inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA,font=\PartNameFont](PST)at([xshift=0.5cm,yshift=\@Part@Star@LabelYShift]HC3.north east){%
\begin{varwidth}{\@DefaultTextwidth-5.0cm}
\@change@minipage@footnote%
\strut#1\strut
\end{varwidth}};}};
\endgroup%
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(ZZ)\ZZWidth
\coordinate(V)at([xshift=\ZZWidth]U);
\coordinate(W)at([xshift=\ZZWidth]X);
%%
%%页面中部色块%%
\path[fill=ColorB,opacity=\@ColorBlock@Opacity,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=\@Part@StripeWidth]W);
%%左侧色块%%
\path[fill=ColorB!75,opacity=\@ColorBlock@Opacity](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%
%%部分副标题%%
\node[align=flush left,anchor=north west,font=\PartNameFont,text=ColorA,inner xsep=0mm](PSST)at([yshift=-\@Part@StripeWidth-0.25cm]X){%
\begin{varwidth}{\@DefaultTextwidth-2.45cm}%
\@change@minipage@footnote%
\expandafter\ifblank\expandafter{\@partsubtitle}{\relax}{\strut\@partsubtitle\strut}%要展开宏再进行非空判断
\end{varwidth}};
%%部分简介%%
\node[align=flush left,anchor=north west,font=\itshape\kaiti,text=ColorA,inner xsep=0mm](IT)at([yshift=-0.5cm]PSST.south west){%
\begin{varwidth}{\@DefaultTextwidth-2.45cm}%
\@change@minipage@footnote%
\@partintro
\end{varwidth}};
%%部分目录%%
\node[inner sep=0mm,outer sep=0mm,minimum width=4.0cm,anchor=south east](SC)at([xshift=-\@ExtraWidth-\@innerlen-2.5mm,yshift=\@ExtraWidth+\@botlen]O){%
\parbox{\@DefaultTextwidth-2.45cm}{%
\begin{multicols}{3}
\begingroup%
\@erase@marginpar%
\@erase@marginnote%
\printcontents[parts]{l}{0}[0]{\def\@pnumwidth{0pt}}%
\endgroup%
\end{multicols}}
};
\end{pgfonlayer}}
%%
%%不编号部分页样式%%
\NewDocumentCommand{\@PartStarStyle}{ +m }{%
\begin{tikzpicture}[remember picture,overlay]
\newdimen\@Part@StripeWidth
\newdimen\@Part@BlockWidth
\newdimen\@Part@TopOuterBlockLength
\newdimen\@Part@MiddleOuterBlockLength
\newdimen\@DefaultTextwidth
%%
\@Part@StripeWidth=0.35cm
\@Part@BlockWidth=1.75cm
\@Part@TopOuterBlockLength=7.0cm
\@Part@MiddleOuterBlockLength=4.0cm
\@DefaultTextwidth=\dimexpr\paperwidth-\@innerlen-\@outerlen\relax
%%
\pgfdeclarelayer{@Part@Star@Top}%
\pgfdeclarelayer{@Part@Star@Bottom}%
\pgfsetlayers{@Part@Star@Bottom,main,@Part@Star@Top}%
%%
%%要展开宏再进行非空判断%%
\expandafter\ifblank\expandafter{\@partimage}{%
\def\@ColorBlock@Opacity{1}%
\def\@WhiteLine@Opacity{1}%
}{%
\def\@ColorBlock@Opacity{0.9}%
\def\@WhiteLine@Opacity{0.3}%
}
%%
\ifodd\value{page}%判断奇偶页
\@Part@Star@OddPage@Style{#1}%
\else%
\@Part@Star@EvenPage@Style{#1}%
\fi
\end{tikzpicture}}
%%
\newif\if@PartStop
\@PartStopfalse
%%编号部分页%%
\titleformat{\part}
{}{}{0mm}
{\@PartStyle{\partlabelfront{\sffamily\thepart}\partlabelback}{#1}%部分样式
\@mkboth{\@subtitle}{\@subtitle}%页眉设置
\thispagestyle{empty}%部分页的页面样式为空白
}[\global\partintro{}%清空\partintro
\global\partimage{}]%清空\partimage
%%不编号部分页%%
\titleformat{name=\part,numberless}
{}{}{0mm}
{\@PartStarStyle{#1}%部分样式
\@mkboth{\@subtitle}{\@subtitle}%页眉设置
\thispagestyle{empty}%部分页的页面样式为空白
}[\global\partintro{}%清空\partintro
\global\partimage{}%清空\partimage
\global\partsubtitle{}]%清空\partsubtitle
%%间距设置%%
\titlespacing*{\part}{0pt}{0pt}{0pt}
%%页面风格设置%%
\assignpagestyle{\part}{PartPage}%部分页后面的空白页样式设置
%%page参数为标题占据一整页，不可以添加文字%%
%%top参数为标题在新的一页生成，可以添加文字%%
%%straight参数为标题与内容连续生成，不自动换页%%
\titleclass{\part}{page}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%定义一个接口，读取aux文件时会调用它来存储到内部命令%%
\NewDocumentCommand{\@Part@Name}{m +m}{%
%#1：部分编号，#2：部分名称
\expandafter\gdef\csname partname@#1\endcsname{#2}%
%\partname@#1为部分名称，但其名称中包含数字（数字表示“部分的序数”，包括编号和不编号部分），不便于使用，因此需要后续的命令对此进行封装。
}
%%存储函数：将长度\partname@#1封装进命令\@Part@Name{#1}{#2}中，并写入aux文件%%
\NewDocumentCommand{\@store@partname}{+m}{%
\begingroup%
\def\@temp@aux{%
\noexpand\@Part@Name{\the@Part@Number}{#1}%
}%
%第一个参数表示部分的序数，第二个参数为部分名称
\immediate\write\@auxout{\@temp@aux}%写入aux文件
\endgroup}
%%读取函数：从aux文件中读取\partname@#1的值，并赋给\@Chap@PartThumb%%
\newcommand{\@use@partname}[1]{%
\ifcsname partname@#1\endcsname%
\def\@Chap@PartThumb{\csname partname@#1\endcsname}%
\else%
\def\@Chap@PartThumb{}%
\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%为\part*添加短页眉%%
\NewCommandCopy{\OriginPart}{\part}
%%
\RenewDocumentCommand{\part}{s +O{#3} +m}{%
\startcontents[parts]%开启小目录
\IfBooleanTF{#1}{%
\OriginPart*{#3}%
\extramarks{#2}{#2}%
}{\if@mainmatter%
\OriginPart[#2]{#3}%
\extramarks{\partlabelfront{\sffamily\thepart}\partlabelback\quad#2}{\partlabelfront{\sffamily\thepart}\partlabelback\quad#2}%
\else%
\OriginPart*{\phantomsection\addcontentsline{toc}{part}{#2}#3}%
\extramarks{#2}{#2}%
\fi}%
\stepcounter{@Part@Number}%
\@store@partname{#2}%将部分名短标题和部分序数写入aux文件中，务必放在part定义的最后
\@PartStopfalse%开启章节页侧标更新和页面底部侧标更新
}

%%章节页样式%%
\newlength{\@ChapterPage@BottomCut}
\newlength{\@ChapterPage@TopCut}
%%%%
\newcommand{\chaptersaying}[1]{\long\def\@chaptersaying{\hspace*{2.0em}#1}}
\newcommand{\chaptersubtitle}[1]{\long\def\@chaptersubtitle{#1}}
\newcommand{\chapterimage}[1]{\long\def\@chapterimage{#1}}
\chaptersaying{}
\chaptersubtitle{}
\chapterimage{}
%%编号章节页样式%%
\NewDocumentCommand{\@ChapterStyle}{ +m +m }{%
\begin{tikzpicture}[remember picture,overlay]
\newdimen\@GutterWidth
\newdimen\@PagePercentLength
\newdimen\@Chapter@PageSize
\newdimen\@Chapter@StripeWidth
\newdimen\@Chapter@LabelSep
\newdimen\@Chapter@LabelYShift@Up
\newdimen\@Chapter@LabelYShift@Down
\newdimen\@Chapter@SayingBlockHeight
\newdimen\@DefaultTextwidth
\newdimen\@DefaultTextheight
%%
\@GutterWidth=\dimexpr\@FrameWidth+\@innerlen-\@outerlen\relax
\@Chapter@PageSize=\dimexpr\@ExtraWidth+\@outerlen-\@FrameWidth-2.0mm\relax
\@Chapter@StripeWidth=0.325cm
\@Chapter@LabelSep=0.5cm
\@Chapter@LabelYShift@Up=0.5cm
\@Chapter@LabelYShift@Down=0.65cm
\@Chapter@SayingBlockHeight=\dimexpr\@ExtraWidth+\@outerlen-2.5mm\relax
\@DefaultTextwidth=\dimexpr\paperwidth-\@innerlen-\@outerlen\relax
\@DefaultTextheight=\dimexpr\paperheight-\@toplen-\@botlen\relax
%%定义页面底部裁剪长度%%
\gsetlength{\@ChapterPage@BottomCut}{\@Chapter@SayingBlockHeight-\@FrameWidth}
%%
\pgfdeclarelayer{@Chapter@Top}
\pgfdeclarelayer{@Chapter@Bottom}
\pgfsetlayers{@Chapter@Bottom,main,@Chapter@Top}
\ifodd\value{page}%判断奇偶页
%%坐标%%
\coordinate(A)at([xshift=-\@ExtraWidth,yshift=\@ExtraWidth]current page.north west);
\coordinate(B)at([xshift=\@ExtraWidth,yshift=\@ExtraWidth]current page.north east);
\coordinate(C)at([xshift=\@ExtraWidth,yshift=-\@ExtraWidth]current page.south east);
\coordinate(D)at([xshift=-\@ExtraWidth,yshift=-\@ExtraWidth]current page.south west);
\coordinate(E)at([xshift=\@GutterWidth,yshift=\@Chapter@SayingBlockHeight]D);
\coordinate(F)at([xshift=-5.0cm,yshift=\@Chapter@SayingBlockHeight]C);
\coordinate(G)at([xshift=-3.0cm,yshift=\@FrameWidth]C);
\coordinate(H)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([xshift=-\@outerlen-\@ExtraWidth,yshift=\@Chapter@LabelYShift@Up-\@toplen]B);
\coordinate(Q1)at([xshift=-\@FrameWidth+0.15cm,yshift=\@FrameWidth-0.15cm]C);
\coordinate(Q2)at([xshift=-\@Chapter@PageSize,yshift=\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
\begin{pgfonlayer}{@Chapter@Top}
%%编号%%
\path[fill=ColorA,sharp corners]node[append after command={(T.south west)[rounded corners=2.5mm]--(T.south east)[sharp corners]--([yshift=\@toplen-2\@Chapter@LabelYShift@Up+\@ExtraWidth]T.north east)--([yshift=\@toplen-2\@Chapter@LabelYShift@Up+\@ExtraWidth]T.north west)[rounded corners=2.5mm]--cycle},anchor=north east,font=\ChapterLabelFont,text=white,inner xsep=\@Chapter@LabelSep,inner ysep=0mm,outer sep=0mm](T)at([yshift=\@Chapter@LabelYShift@Up-\@ExtraWidth]N){%
\begin{varwidth}{\@DefaultTextwidth/3}
\@change@minipage@footnote%
\strut#1\strut
\end{varwidth}};
%%渐变带%%
\path[fill=ColorB!90,opacity=0.9]([xshift=\@outerlen+\@ExtraWidth,yshift=-3\@Chapter@LabelYShift@Down/4+2.0pt]T.south east)rectangle([xshift=-\paperwidth+\@outerlen-\@ExtraWidth,yshift=-3\@Chapter@LabelYShift@Down/4-\@Chapter@StripeWidth-2.0pt]T.south east);
%%记录当前页占文档总页数的百分比%%
\def\@PagePercent{\fpeval{\arabic{totalpages}/\@abspage@last}}
\@PagePercentLength=\dimeval{\@innerlen+\@PagePercent\@DefaultTextwidth+\@ExtraWidth}
%%
\coordinate(PUL)at([xshift=-\paperwidth+\@outerlen-\@ExtraWidth,yshift=-3\@Chapter@LabelYShift@Down/4]T.south east);
\coordinate(PUR)at([xshift=-\paperwidth+\@outerlen+\@PagePercentLength,yshift=-3\@Chapter@LabelYShift@Down/4]T.south east);
\coordinate(PDR)at([xshift=-\paperwidth+\@outerlen+\@PagePercentLength,yshift=-3\@Chapter@LabelYShift@Down/4-\@Chapter@StripeWidth]T.south east);
\coordinate(PDL)at([xshift=-\paperwidth+\@outerlen-\@ExtraWidth,yshift=-3\@Chapter@LabelYShift@Down/4-\@Chapter@StripeWidth]T.south east);
%%
\path[fill=ColorA,opacity=0.8](PUL)[rounded corners=\@Chapter@StripeWidth/2]--(PUR)--(PDR)[sharp corners]--(PDL)--cycle;
%%标题%%
\node[inner sep=0mm,anchor=north east,font=\ChapterNameFont,text=ColorA](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]T.south east){%
\begin{varwidth}{\@DefaultTextwidth}
\@change@minipage@footnote%
\strut#2\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=\@outerlen-\@FrameWidth+\@ExtraWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
\coordinate(J)at([xshift=-\paperwidth+\@outerlen+\@GutterWidth-\@ExtraWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
\coordinate(K)at([xshift=-\@GutterWidth]J);
\coordinate(L)at([yshift=-\@toplen-\@ExtraWidth]A);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(K)(L)\@Chapter@TitleBlockHeight
%若标题区域高度过高（大于三分之一默认版心高度）
\ifdim\@Chapter@TitleBlockHeight>\dimexpr\@DefaultTextheight/3\relax
%并压缩标题高度
\coordinate(I)at([xshift=\paperwidth-\@FrameWidth+2\@ExtraWidth,yshift=-\@DefaultTextheight/3]L);
\coordinate(J)at([xshift=\@GutterWidth,yshift=-\@DefaultTextheight/3]L);
\coordinate(K)at([yshift=-\@DefaultTextheight/3]L);
\pgfgetdistance(K)(L)\@Chapter@TitleBlockHeight
\fi
\gsetlength{\@ChapterPage@TopCut}{\@Chapter@TitleBlockHeight+\@toplen-\@FrameWidth+\@ExtraWidth}
%%%%
\begin{pgfonlayer}{@Chapter@Bottom}
%%框架%%
\path[fill=ColorB!7.5,even odd rule,sharp corners]
(A)--(B)--(C)--(D)--cycle
(J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=0,out=180]to(F)[sharp corners]--(E)--cycle;
%%章节图片%%
%%裁剪超出页面范围的图片%%
\clip(A)rectangle(C);
\node[anchor=north west,outer sep=0mm,inner sep=0mm](U)at(A){\@chapterimage};
%%如果\@chapterimage不为空则添加白色透明蒙版%%
\expandafter\ifblank\expandafter{\@chapterimage}{\relax}{%
\path[fill=white,opacity=0.3,even odd rule,sharp corners]%
(A)--(B)--(C)--(D)--cycle
(J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=0,out=180]to(F)[sharp corners]--(E)--cycle;}
%%白色半透明蒙版%%
\path[fill=white,opacity=0.75](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=0,out=180]to(F)[sharp corners]--(E)--cycle;
\end{pgfonlayer}
%%
\begin{pgfonlayer}{@Chapter@Top}
%%底部文字%%
\node[anchor=west,font=\ChapterSayingFont,text=ColorA,text width=\paperwidth-\@innerlen-5.0cm,inner sep=0mm,outer sep=0mm](S)at([xshift=\@innerlen,yshift=\@ExtraWidth/2+\@Chapter@SayingBlockHeight/2]D){\@chaptersaying};
%%页码%%
\path[fill=ColorA,rounded corners=2.0mm](Q1)rectangle(Q2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
\else
\coordinate(A)at([xshift=\@ExtraWidth,yshift=\@ExtraWidth]current page.north east);
\coordinate(B)at([xshift=-\@ExtraWidth,yshift=\@ExtraWidth]current page.north west);
\coordinate(C)at([xshift=-\@ExtraWidth,yshift=-\@ExtraWidth]current page.south west);
\coordinate(D)at([xshift=\@ExtraWidth,yshift=-\@ExtraWidth]current page.south east);
\coordinate(E)at([xshift=-\@GutterWidth,yshift=\@Chapter@SayingBlockHeight]D);
\coordinate(F)at([xshift=5.0cm,yshift=\@Chapter@SayingBlockHeight]C);
\coordinate(G)at([xshift=3.0cm,yshift=\@FrameWidth]C);
\coordinate(H)at([xshift=\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([xshift=\@outerlen+\@ExtraWidth,yshift=\@Chapter@LabelYShift@Up-\@toplen]B);
\coordinate(Q1)at([xshift=\@FrameWidth-0.15cm,yshift=\@FrameWidth-0.15cm]C);
\coordinate(Q2)at([xshift=\@Chapter@PageSize,yshift=\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
\begin{pgfonlayer}{@Chapter@Top}
%%编号%%
\path[fill=ColorA,sharp corners]node[append after command={(T.south west)[rounded corners=2.5mm]--(T.south east)[sharp corners]--([yshift=\@toplen-2\@Chapter@LabelYShift@Up+\@ExtraWidth]T.north east)--([yshift=\@toplen-2\@Chapter@LabelYShift@Up+\@ExtraWidth]T.north west)[rounded corners=2.5mm]--cycle},anchor=north west,font=\ChapterLabelFont,text=white,inner xsep=\@Chapter@LabelSep,inner ysep=0mm,outer sep=0mm](T)at([yshift=\@Chapter@LabelYShift@Up-\@ExtraWidth]N){%
\begin{varwidth}{\@DefaultTextwidth/3}%
\@change@minipage@footnote%
\strut#1\strut
\end{varwidth}};
%%渐变带%%
\path[fill=ColorB!90,opacity=0.9]([xshift=-\@outerlen-\@ExtraWidth,yshift=-3\@Chapter@LabelYShift@Down/4+2.0pt]T.south west)rectangle([xshift=\paperwidth-\@outerlen+\@ExtraWidth,yshift=-3\@Chapter@LabelYShift@Down/4-\@Chapter@StripeWidth-2.0pt]T.south west);
%%记录当前页占文档总页数的百分比%%
\def\@PagePercent{\fpeval{\arabic{totalpages}/\@abspage@last}}
\@PagePercentLength=\dimeval{\@innerlen+\@PagePercent\@DefaultTextwidth+\@ExtraWidth}
%%
\coordinate(PUL)at([xshift=-\@outerlen-\@ExtraWidth,yshift=-3\@Chapter@LabelYShift@Down/4]T.south west);
\coordinate(PUR)at([xshift=-\@outerlen+\@PagePercentLength,yshift=-3\@Chapter@LabelYShift@Down/4]T.south west);
\coordinate(PDR)at([xshift=-\@outerlen+\@PagePercentLength,yshift=-3\@Chapter@LabelYShift@Down/4-\@Chapter@StripeWidth]T.south west);
\coordinate(PDL)at([xshift=-\@outerlen-\@ExtraWidth,yshift=-3\@Chapter@LabelYShift@Down/4-\@Chapter@StripeWidth]T.south west);
%%
\path[fill=ColorA,opacity=0.8](PUL)[rounded corners=\@Chapter@StripeWidth/2]--(PUR)--(PDR)[sharp corners]--(PDL)--cycle;
%%标题%%
\node[inner sep=0mm,anchor=north west,font=\ChapterNameFont,text=ColorA](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]T.south west){%
\begin{varwidth}{\@DefaultTextwidth}
\@change@minipage@footnote%
\strut#2\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=-\@outerlen+\@FrameWidth-\@ExtraWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
\coordinate(J)at([xshift=\paperwidth-\@outerlen-\@GutterWidth+\@ExtraWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
\coordinate(K)at([xshift=\@GutterWidth]J);
\coordinate(L)at([yshift=-\@toplen-\@ExtraWidth]A);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(K)(L)\@Chapter@TitleBlockHeight
%若标题区域高度过高（大于三分之一默认版心高度）
\ifdim\@Chapter@TitleBlockHeight>\dimexpr\@DefaultTextheight/3\relax
%并压缩副标题高度
\coordinate(I)at([xshift=-\paperwidth+\@FrameWidth-2\@ExtraWidth,yshift=-\@DefaultTextheight/3]L);
\coordinate(J)at([xshift=-\@GutterWidth,yshift=-\@DefaultTextheight/3]L);
\coordinate(K)at([yshift=-\@DefaultTextheight/3]L);
\pgfgetdistance(K)(L)\@Chapter@TitleBlockHeight
\fi
\gsetlength{\@ChapterPage@TopCut}{\@Chapter@TitleBlockHeight+\@toplen-\@FrameWidth+\@ExtraWidth}
%%%%
\begin{pgfonlayer}{@Chapter@Bottom}
%%框架%%
\path[fill=ColorB!7.5,even odd rule,sharp corners]
(A)--(B)--(C)--(D)--cycle
(J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=180,out=0]to(F)[sharp corners]--(E)--cycle;
%%章节图片%%
%%裁剪超出页面范围的图片%%
\clip(A)rectangle(C);
\node[anchor=north east,outer sep=0mm,inner sep=0mm](U)at(A){\@chapterimage};
%%如果\@chapterimage不为空则添加白色透明蒙版%%
\expandafter\ifblank\expandafter{\@chapterimage}{\relax}{%
\path[fill=white,opacity=0.3,even odd rule,sharp corners]%
(A)--(B)--(C)--(D)--cycle
(J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=180,out=0]to(F)[sharp corners]--(E)--cycle;}
%%白色半透明蒙版%%
\path[fill=white,opacity=0.75](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=180,out=0]to(F)[sharp corners]--(E)--cycle;
\end{pgfonlayer}
%%
\begin{pgfonlayer}{@Chapter@Top}
%%底部文字%%
\node[anchor=east,font=\ChapterSayingFont,text=ColorA,text width=\paperwidth-\@innerlen-5.0cm,inner sep=0mm,outer sep=0mm](S)at([xshift=-\@innerlen,yshift=\@ExtraWidth/2+\@Chapter@SayingBlockHeight/2]D){\@chaptersaying};
%%页码%%
\path[fill=ColorA,rounded corners=2.0mm](Q1)rectangle(Q2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
\fi
\end{tikzpicture}
}
%%
%%不编号章节样式%%
\NewDocumentCommand{\@ChapterStarStyle}{ +m +m }{%
\begin{tikzpicture}[remember picture,overlay]
\newdimen\@GutterWidth
\newdimen\@PagePercentLength
\newdimen\@Chapter@PageSize
\newdimen\@Chapter@StripeWidth
\newdimen\@Chapter@Star@LabelNameXSep
\newdimen\@Chapter@Star@LabelYShift@Up
\newdimen\@Chapter@Star@LabelYShift@Down
\newdimen\@Chapter@SayingBlockHeight
\newdimen\@DefaultTextwidth
\newdimen\@DefaultTextheight
%%
\@GutterWidth=\dimexpr\@FrameWidth+\@innerlen-\@outerlen\relax
\@Chapter@PageSize=\dimexpr\@ExtraWidth+\@outerlen-\@FrameWidth-2.0mm\relax
\@Chapter@StripeWidth=0.325cm
\@Chapter@Star@LabelNameXSep=0.4cm
\@Chapter@Star@LabelYShift@Up=0.5cm
\@Chapter@Star@LabelYShift@Down=0.65cm
\@Chapter@SayingBlockHeight=\dimexpr\@ExtraWidth+\@outerlen-2.5mm\relax
\@DefaultTextwidth=\dimexpr\paperwidth-\@innerlen-\@outerlen\relax
\@DefaultTextheight=\dimexpr\paperheight-\@toplen-\@botlen\relax
%%定义页面底部裁剪长度%%
\gsetlength{\@ChapterPage@BottomCut}{\@Chapter@SayingBlockHeight-\@FrameWidth}
%%
\pgfdeclarelayer{@Chapter@Star@Top}
\pgfdeclarelayer{@Chapter@Star@Bottom}
\pgfsetlayers{@Chapter@Star@Bottom,main,@Chapter@Star@Top}
\ifodd\value{page}%判断奇偶页
%%坐标点%%
\coordinate(A)at([xshift=-\@ExtraWidth,yshift=\@ExtraWidth]current page.north west);
\coordinate(B)at([xshift=\@ExtraWidth,yshift=\@ExtraWidth]current page.north east);
\coordinate(C)at([xshift=\@ExtraWidth,yshift=-\@ExtraWidth]current page.south east);
\coordinate(D)at([xshift=-\@ExtraWidth,yshift=-\@ExtraWidth]current page.south west);
\coordinate(E)at([xshift=\@GutterWidth,yshift=\@Chapter@SayingBlockHeight]D);
\coordinate(F)at([xshift=-5.0cm,yshift=\@Chapter@SayingBlockHeight]C);
\coordinate(G)at([xshift=-3.0cm,yshift=\@FrameWidth]C);
\coordinate(H)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([xshift=\@innerlen+\@ExtraWidth,yshift=\@Chapter@Star@LabelYShift@Up-\@toplen-\@ExtraWidth]A);
\coordinate(Q1)at([xshift=-\@FrameWidth+0.15cm,yshift=\@FrameWidth-0.15cm]C);
\coordinate(Q2)at([xshift=-\@Chapter@PageSize,yshift=\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
\begin{pgfonlayer}{@Chapter@Star@Top}%
\begingroup%
\ChapterLabelFont%
\newdimen\@Chapter@Star@LabelRadius%
\newdimen\@Chapter@Star@LabelYShift%
%%
\@Chapter@Star@LabelRadius=\dimeval{0.75\baselineskip/2}
\@Chapter@Star@LabelYShift=\dimeval{0.25\baselineskip/4}%
%%标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text width=\@DefaultTextwidth,align=flush left](TT)at([yshift=\@Chapter@Star@LabelYShift@Up]N){%
\tikz{%
\node[inner sep=0mm,outer sep=0mm,anchor=north west](P1){\@HalfCircle@Label{ColorA}{\@Chapter@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](P2)at(P1.east){\@HalfCircle@Label{ColorA!80}{\@Chapter@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA,font=\ChapterLabelFont](P3)at([xshift=\@Chapter@Star@LabelNameXSep,yshift=\@Chapter@Star@LabelYShift]P2.north east){%
\begin{varwidth}{\@DefaultTextwidth-2\@Chapter@Star@LabelRadius-\@Chapter@Star@LabelNameXSep}
\@change@minipage@footnote%
\strut#1\strut
\end{varwidth}};}};
\endgroup%
%%
%%渐变带%%
\path[fill=ColorB!90,opacity=0.9]([xshift=-\@innerlen-\@ExtraWidth,yshift=-3\@Chapter@Star@LabelYShift@Down/4+2.0pt]TT.south west)rectangle([xshift=\@outerlen+\@ExtraWidth,yshift=-3\@Chapter@Star@LabelYShift@Down/4-\@Chapter@StripeWidth-2.0pt]TT.south east);
%%记录当前页占文档总页数的百分比%%
\def\@PagePercent{\fpeval{\arabic{totalpages}/\@abspage@last}}
\@PagePercentLength=\dimeval{\@innerlen+\@PagePercent\@DefaultTextwidth+\@ExtraWidth}
%%
\coordinate(PUL)at([xshift=-\@innerlen-\@ExtraWidth,yshift=-3\@Chapter@Star@LabelYShift@Down/4]TT.south west);
\coordinate(PUR)at([xshift=-\@innerlen+\@PagePercentLength,yshift=-3\@Chapter@Star@LabelYShift@Down/4]TT.south west);
\coordinate(PDR)at([xshift=-\@innerlen+\@PagePercentLength,yshift=-3\@Chapter@Star@LabelYShift@Down/4-\@Chapter@StripeWidth]TT.south west);
\coordinate(PDL)at([xshift=-\@innerlen-\@ExtraWidth,yshift=-3\@Chapter@Star@LabelYShift@Down/4-\@Chapter@StripeWidth]TT.south west);
%%
\path[fill=ColorA,opacity=0.8](PUL)[rounded corners=\@Chapter@StripeWidth/2]--(PUR)--(PDR)[sharp corners]--(PDL)--cycle;
%%副标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north east,text=ColorA,font=\ChapterNameFont,align=flush right](P)at([yshift=-4\@Chapter@Star@LabelYShift@Down/3-\@Chapter@StripeWidth]TT.south east){%
\begin{varwidth}{2\@DefaultTextwidth/3}
\@change@minipage@footnote%
\strut#2\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=\@outerlen-\@FrameWidth+\@ExtraWidth,yshift=-2\@Chapter@Star@LabelYShift@Down/3]P.south east);
\coordinate(J)at([xshift=-\paperwidth+\@outerlen+\@GutterWidth-\@ExtraWidth,yshift=-2\@Chapter@Star@LabelYShift@Down/3]P.south east);
\coordinate(K)at([xshift=-\@GutterWidth]J);
\coordinate(L)at([yshift=-\@toplen-\@ExtraWidth]A);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(K)(L)\@Chapter@TitleBlockHeight
%若标题区域高度过高（大于三分之一默认版心高度）
\ifdim\@Chapter@TitleBlockHeight>\dimexpr\@DefaultTextheight/3\relax
%并压缩副标题高度
\coordinate(I)at([xshift=\paperwidth-\@FrameWidth+2\@ExtraWidth,yshift=-\@DefaultTextheight/3]L);
\coordinate(J)at([xshift=\@GutterWidth,yshift=-\@DefaultTextheight/3]L);
\coordinate(K)at([yshift=-\@DefaultTextheight/3]L);
\pgfgetdistance(K)(L)\@Chapter@TitleBlockHeight
\fi
\gsetlength{\@ChapterPage@TopCut}{\@Chapter@TitleBlockHeight+\@toplen-\@FrameWidth+\@ExtraWidth}
%%%%
\begin{pgfonlayer}{@Chapter@Star@Bottom}
%%框架%%
\path[fill=ColorB!7.5,even odd rule,sharp corners]
(A)--(B)--(C)--(D)--cycle
(J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=0,out=180]to(F)[sharp corners]--(E)--cycle;
%%章节图片%%
%%裁剪超出页面范围的图片%%
\clip(A)rectangle(C);
\node[anchor=north west,outer sep=0mm,inner sep=0mm](U)at(A){\@chapterimage};
%%如果\@chapterimage不为空则添加白色透明蒙版%%
\expandafter\ifblank\expandafter{\@chapterimage}{\relax}{%
\path[fill=white,opacity=0.3,even odd rule,sharp corners]%
(A)--(B)--(C)--(D)--cycle
(J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=0,out=180]to(F)[sharp corners]--(E)--cycle;}
%%白色半透明蒙版%%
\path[fill=white,opacity=0.75](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=0,out=180]to(F)[sharp corners]--(E)--cycle;
\end{pgfonlayer}
%%
\begin{pgfonlayer}{@Chapter@Star@Top}
%%底部文字%%
\node[anchor=west,font=\ChapterSayingFont,text=ColorA,text width=\paperwidth-\@innerlen-5.0cm,inner sep=0mm,outer sep=0mm](S)at([xshift=\@innerlen,yshift=\@ExtraWidth/2+\@Chapter@SayingBlockHeight/2]D){\@chaptersaying};
%%页码%%
\path[fill=ColorA,rounded corners=2.0mm](Q1)rectangle(Q2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
\else
%%坐标点%%
\coordinate(A)at([xshift=\@ExtraWidth,yshift=\@ExtraWidth]current page.north east);
\coordinate(B)at([xshift=-\@ExtraWidth,yshift=\@ExtraWidth]current page.north west);
\coordinate(C)at([xshift=-\@ExtraWidth,yshift=-\@ExtraWidth]current page.south west);
\coordinate(D)at([xshift=\@ExtraWidth,yshift=-\@ExtraWidth]current page.south east);
\coordinate(E)at([xshift=-\@GutterWidth,yshift=\@Chapter@SayingBlockHeight]D);
\coordinate(F)at([xshift=5.0cm,yshift=\@Chapter@SayingBlockHeight]C);
\coordinate(G)at([xshift=3.0cm,yshift=\@FrameWidth]C);
\coordinate(H)at([xshift=\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([xshift=-\@innerlen-\@ExtraWidth,yshift=\@Chapter@Star@LabelYShift@Up-\@toplen-\@ExtraWidth]A);
\coordinate(Q1)at([xshift=\@FrameWidth-0.15cm,yshift=\@FrameWidth-0.15cm]C);
\coordinate(Q2)at([xshift=\@Chapter@PageSize,yshift=\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
%%
\begin{pgfonlayer}{@Chapter@Star@Top}%
\begingroup%
\ChapterLabelFont%
\newdimen\@Chapter@Star@LabelRadius%
\newdimen\@Chapter@Star@LabelYShift%
%%
\@Chapter@Star@LabelRadius=\dimeval{0.75\baselineskip/2}
\@Chapter@Star@LabelYShift=\dimeval{0.25\baselineskip/4}%
%%标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north east,text width=\@DefaultTextwidth,align=flush right](TT)at([yshift=\@Chapter@Star@LabelYShift@Up]N){%
\tikz{%
\node[inner sep=0mm,outer sep=0mm,anchor=north west](P1){\@HalfCircle@Label{ColorA}{\@Chapter@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](P2)at(P1.east){\@HalfCircle@Label{ColorA!80}{\@Chapter@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA,font=\ChapterLabelFont](P3)at([xshift=\@Chapter@Star@LabelNameXSep,yshift=\@Chapter@Star@LabelYShift]P2.north east){%
\begin{varwidth}{\@DefaultTextwidth-2\@Chapter@Star@LabelRadius-\@Chapter@Star@LabelNameXSep}
\@change@minipage@footnote%
\strut#1\strut
\end{varwidth}};
}};
\endgroup%
%%
%%渐变带%%
\path[fill=ColorB!90,opacity=0.9]([xshift=\@innerlen+\@ExtraWidth,yshift=-3\@Chapter@Star@LabelYShift@Down/4+2.0pt]TT.south east)rectangle([xshift=-\@outerlen-\@ExtraWidth,yshift=-3\@Chapter@Star@LabelYShift@Down/4-\@Chapter@StripeWidth-2.0pt]TT.south west);
%%记录当前页占文档总页数的百分比%%
\def\@PagePercent{\fpeval{\arabic{totalpages}/\@abspage@last}}
\@PagePercentLength=\dimeval{\@innerlen+\@PagePercent\@DefaultTextwidth+\@ExtraWidth}
%%
\coordinate(PUL)at([xshift=-\@outerlen-\@ExtraWidth,yshift=-3\@Chapter@Star@LabelYShift@Down/4]TT.south west);
\coordinate(PUR)at([xshift=-\@outerlen+\@PagePercentLength,yshift=-3\@Chapter@Star@LabelYShift@Down/4]TT.south west);
\coordinate(PDR)at([xshift=-\@outerlen+\@PagePercentLength,yshift=-3\@Chapter@Star@LabelYShift@Down/4-\@Chapter@StripeWidth]TT.south west);
\coordinate(PDL)at([xshift=-\@outerlen-\@ExtraWidth,yshift=-3\@Chapter@Star@LabelYShift@Down/4-\@Chapter@StripeWidth]TT.south west);
%%
\path[fill=ColorA,opacity=0.8](PUL)[rounded corners=\@Chapter@StripeWidth/2]--(PUR)--(PDR)[sharp corners]--(PDL)--cycle;
%%副标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA,font=\ChapterNameFont,align=flush left](P)at([yshift=-4\@Chapter@Star@LabelYShift@Down/3-\@Chapter@StripeWidth]TT.south west){%
\begin{varwidth}{2\@DefaultTextwidth/3}
\@change@minipage@footnote%
\strut#2\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=-\@outerlen+\@FrameWidth-\@ExtraWidth,yshift=-2\@Chapter@Star@LabelYShift@Down/3]P.south west);
\coordinate(J)at([xshift=\paperwidth-\@outerlen-\@GutterWidth+\@ExtraWidth,yshift=-2\@Chapter@Star@LabelYShift@Down/3]P.south west);
\coordinate(K)at([xshift=\@GutterWidth]J);
\coordinate(L)at([yshift=-\@toplen-\@ExtraWidth]A);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(K)(L)\@Chapter@TitleBlockHeight
%若标题区域高度过高（大于三分之一默认版心高度）
\ifdim\@Chapter@TitleBlockHeight>\dimexpr\@DefaultTextheight/3\relax
%并压缩副标题高度
\coordinate(I)at([xshift=-\paperwidth+\@FrameWidth-2\@ExtraWidth,yshift=-\@DefaultTextheight/3]L);
\coordinate(J)at([xshift=-\@GutterWidth,yshift=-\@DefaultTextheight/3]L);
\coordinate(K)at([yshift=-\@DefaultTextheight/3]L);
\pgfgetdistance(K)(L)\@Chapter@TitleBlockHeight
\fi
\gsetlength{\@ChapterPage@TopCut}{\@Chapter@TitleBlockHeight+\@toplen-\@FrameWidth+\@ExtraWidth}
%%%%
\begin{pgfonlayer}{@Chapter@Star@Bottom}
%%框架%%
\path[fill=ColorB!7.5,even odd rule,sharp corners]
(A)--(B)--(C)--(D)--cycle
(J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=180,out=0]to(F)[sharp corners]--(E)--cycle;
%%章节图片%%
%%裁剪超出页面范围的图片%%
\clip(A)rectangle(C);
\node[anchor=north east,outer sep=0mm,inner sep=0mm](U)at(A){\@chapterimage};
%%如果\@chapterimage不为空则添加白色透明蒙版%%
\expandafter\ifblank\expandafter{\@chapterimage}{\relax}{%
\path[fill=white,opacity=0.3,even odd rule,sharp corners]%
(A)--(B)--(C)--(D)--cycle
(J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=0,out=180]to(F)[sharp corners]--(E)--cycle;}
%%白色半透明蒙版%%
\path[fill=white,opacity=0.75](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=180,out=0]to(F)[sharp corners]--(E)--cycle;
\end{pgfonlayer}
%%
\begin{pgfonlayer}{@Chapter@Star@Top}
%%底部文字%%
\node[anchor=east,font=\ChapterSayingFont,text=ColorA,text width=\paperwidth-\@innerlen-5.0cm,inner sep=0mm,outer sep=0mm](S)at([xshift=-\@innerlen,yshift=\@ExtraWidth/2+\@Chapter@SayingBlockHeight/2]D){\@chaptersaying};
%%页码%%
\path[fill=ColorA,rounded corners=2.0mm](Q1)rectangle(Q2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
\fi
\end{tikzpicture}}

%%%%%%%%%%%%%%%
%%定义一个接口，读取aux文件时会调用它来存储到内部命令%%
\newcommand*{\@Chapter@Page@Cut}[3]{%
%#1：章编号，#2，#3：长度文本
\expandafter\gdef\csname chaptopcut@#1\endcsname{#2}%
\expandafter\gdef\csname chapbotcut@#1\endcsname{#3}%
%\chap***cut@#1 为一长度变量，用于储存章节页上半部分的版心高度裁剪长度，但其名称中包含数字（数字表示“章节的序数”，包括编号和不编号章节），不便于使用，因此需要后续的命令对这一长度变量进行封装。
}
%%存储函数：将长度\chap***cut@#1 封装进命令\@Chapter@Page@Cut{#1}{#2}{#3}中，并写入aux文件%%
\newcommand{\@store@chapcut}{%
\begingroup%
\def\@temp@aux{%
\noexpand\@Chapter@Page@Cut{\the@Chapter@Number}{\the\@ChapterPage@TopCut}{\the\@ChapterPage@BottomCut}%
}%
%第一个参数表示章节的序数，第二个参数为版心顶部裁剪长度\@ChapterPage@TopCut的数值，第三个参数为版心底部裁剪长度\@ChapterPage@BottomCut的数值
\immediate\write\@auxout{\@temp@aux}%写入aux文件
\endgroup}
%%读取函数：从aux文件中读取\chap***cut@#1的值，并赋给\@ChapterPage@***Cut%%
\newcommand{\@use@chapcut}{%
\ifcsname chaptopcut@\the@Chapter@Number\endcsname%
\gsetlength{\@ChapterPage@TopCut}{\dimexpr\csname chaptopcut@\the@Chapter@Number\endcsname\relax}%
\else%
\gsetlength{\@ChapterPage@TopCut}{0pt}%
\fi%
%%
\ifcsname chapbotcut@\the@Chapter@Number\endcsname%
\gsetlength{\@ChapterPage@BottomCut}{\dimexpr\csname chapbotcut@\the@Chapter@Number\endcsname\relax}%
\else%
\gsetlength{\@ChapterPage@BottomCut}{0pt}%
\fi}

%%%%%%%%%%%%%%%
%%编号章节页%%
\titleformat{\chapter}[block]
{\setbaselineskip{0pt}\selectfont}{}{0mm}
{\@ChapterStyle{\chapterlabelfront{\sffamily\thechapter}\chapterlabelback}{#1}%章样式
}[\global\chapterimage{}%清空\chapterimage
\global\chaptersaying{}%清空\chaptersaying
]

%%不编号章节页%%
\titleformat{name=\chapter,numberless}[block]
{\setbaselineskip{0pt}\selectfont}{}{0mm}
{\@ChapterStarStyle{#1}{\@chaptersubtitle}%章样式
}[\global\chaptersubtitle{}%清空\chaptersubtitle
\global\chapterimage{}%清空\chapterimage
\global\chaptersaying{}%清空\chaptersaying
]
%%间距设置%%
\titlespacing*{\chapter}{0pt}{0pt}{0pt}
%%页面风格设置%%
\assignpagestyle{\chapter}{ChapterPage}
%%page参数为标题占据一整页，不可以添加文字%%
%%top参数为标题在新的一页生成，可以添加文字%%
%%straight参数为标题与内容连续生成，不自动换页%%
\titleclass{\chapter}{top}

%%修改chapter断页方式%%
\newcommand{\chapterbreak}{%
\if@openright%
\cleardoublepage%
\else%
\clearpage%
\fi%
\stepcounter{@Chapter@Number}%写入页面裁切高度时更新章计数器，后续对于不编号不写入目录的章节要减去1
%从aux文件中读取\chap***cut@#1的值，并赋给\@ChapterPage@***Cut
\@use@chapcut%
%临时修改章首页的版心高度为章底部文字留出空间
\gaddtolength{\topmargin}{\@ChapterPage@TopCut}%
\changetextheight{-\@ChapterPage@BottomCut-\@ChapterPage@TopCut}%
%恢复默认版心高度
\AtBeginShipoutNext{%相当于\AddToHookNext{shipout/before}
\gaddtolength{\topmargin}{-\@ChapterPage@TopCut}%
\changetextheight{\@ChapterPage@BottomCut+\@ChapterPage@TopCut}}%
\@PartEnd%用于控制部分目录的截止、章节页侧标的关闭以及页面底部标记恢复默认状态
}
%%默认此命令定义为空%%
\def\@PartEnd{}
%%使用此命令将给出\@PartEnd的定义%%
\newcommand{\PartEnd}{%
\def\@PartEnd{%
\extramarks{\protect\@seriesname}{\protect\@seriesname}%恢复默认页面底部标记
\@PartStoptrue%章节页侧标停止更新
\ifnum\value{@Part@Number}>0%若使用\chapter命令时文档中已经存在部分层次则执行部分目录的停止与恢复，如不然会报错
\stopcontents[parts]%部分目录截止
\fi
}}

%%为\chapter*添加短页眉%%
\NewCommandCopy{\OriginChapter}{\chapter}
%%
\RenewDocumentCommand{\chapter}{s +O{#3} +m}{%
\IfBooleanTF{#1}{%
\OriginChapter*{#3}%
\markboth{#2}{#2}%
}{\OriginChapter[#2]{#3}}%
%将长度\chap***cut@#1 封装进命令\@Chapter@Page@***@Cut{#1}{#2}{#3}中，并写入aux文件
\@store@chapcut%
%强制清除章首页的\topskip距离
\kern-\topskip
%清除章首页其他的额外垂直空白距离
\nointerlineskip%
}

%%节样式%%
%%编号节样式%%
\titleformat{\section}[hang]{\vspace*{0.5cm}\SectionFont}{%
\sectionlabelfront%
\hspace{2.0mm}%
\tikz[baseline=-0.4em]{%
\begingroup%
\SectionFont%
\newdimen\@Section@LabelRadius%
\@Section@LabelRadius=\dimexpr\baselineskip/2\relax%
\path[fill=ColorA](0,0)circle(\@Section@LabelRadius);
\node[circle,outer sep=0mm,inner sep=0mm,font=\SectionFont\sffamily,text=white]{\maxsizebox{2\@Section@LabelRadius}{!}{\thesection}};
\endgroup}%
\hspace{2.0mm}%
\sectionlabelback}{7.5mm}{#1}

%%不编号节样式%%
\titleformat{name=\section,numberless}[hang]{\vspace*{0.5cm}\color{ColorB}\SectionFont}{%
\tikz[baseline=-0.4em]{%
\begingroup%
\SectionFont%
\newdimen\@Section@Star@LabelRadius%
\@Section@Star@LabelRadius=\dimexpr\baselineskip/2\relax%
\path[fill=ColorB!75](0,0)circle(\@Section@Star@LabelRadius);
\draw[white,fill=ColorB,line width=2.75pt](0,0)circle(7*\@Section@Star@LabelRadius/12);
\endgroup}
}{4.0mm}{#1}
%%间距设置%%
\titlespacing*{\section}{0pt}{0pt}{2.0cm}
%%页面风格设置%%
\assignpagestyle{\section}{MainPage}
%%page参数为标题占据一整页，不可以添加文字%%
%%top参数为标题在新的一页生成，可以添加文字%%
%%straight参数为标题与内容连续生成，不自动换页%%
\titleclass{\section}{top}
%%修改section断页方式%%
\newcommand{\sectionbreak}{\clearpage}
%%%%
\NewCommandCopy{\OriginSection}{\section}
%%
\RenewDocumentCommand{\section}{s +O{#3} +m}{%
\IfBooleanTF{#1}{%
\OriginSection*{#3}%
\markright{#2}%
}{\if@mainmatter%
\OriginSection[#2]{#3}%
\else%
\OriginSection*{\phantomsection\addcontentsline{toc}{section}{#2}#3}%
\markright{#2}%
\fi}
}

%%小节标题样式%%
%%编号小节标题样式%%
\NewDocumentCommand{\@SubsectionStyle}{ +m +m +m }{%
\noindent%
\begin{tikzpicture}[use as bounding box]%
\SubsectionFont%
\newdimen\@Subsection@Radius%
\newdimen\@Subsection@BRadius%
\newdimen\@Subsection@LabelHSkip%
%%
\@Subsection@Radius=\dimexpr\baselineskip/2\relax%0.9
\@Subsection@BRadius=\dimexpr\baselineskip/2+6.5pt\relax%
\@Subsection@LabelHSkip=\dimexpr\baselineskip-2.5mm\relax%
%%
\pgfdeclarelayer{@Subsection@Bottom}%
\pgfsetlayers{@Subsection@Bottom,main}%
\node[text=white,font=\SubsectionFont,inner xsep=\@Subsection@Radius,inner ysep=0mm,outer sep=0mm](L){%
\begin{varwidth}{4.0cm}
\@change@minipage@footnote%
%\AdjustStrut{0.9}%
\strut#1\strut
\end{varwidth}%
\hspace*{\@Subsection@LabelHSkip}};
\pgfgetnodewidth(L)\@Subsection@LabelWidth
%%
\node[text=ColorA,font=\SubsectionFont,inner xsep=\@Subsection@Radius,inner ysep=0mm,outer sep=0mm,minimum width=\linewidth-\@Subsection@LabelWidth,anchor=north west](N)at(L.north east){\hspace*{\@Subsection@LabelHSkip}%
\begin{minipage}{\linewidth-\@Subsection@LabelWidth-2\@Subsection@Radius-\@Subsection@LabelHSkip}
\@change@minipage@footnote%
%\AdjustStrut{0.9}%
\strut#2\strut
\end{minipage}};
\pgfgetnodeheight(N)\@Subsection@NameHeight
%%
\begin{pgfonlayer}{@Subsection@Bottom}
\path[fill=ColorA,rounded corners=\@Subsection@Radius](L.north west)rectangle(L.south east);
\path[fill=white]([yshift=-\@Subsection@Radius]L.north east)circle(\@Subsection@BRadius);
\ifdim\@Subsection@NameHeight>\dimexpr2\@Subsection@Radius\relax
\expandafter\ifblank\expandafter{#2}{\relax}{%
\path[fill=ColorB!7.5](N.north east)[sharp corners]--(N.north west)[rounded corners=\@Subsection@Radius]--(N.south west)--(N.south east)--cycle;}
\else
\expandafter\ifblank\expandafter{#2}{\relax}{%
\path[fill=ColorB!7.5](N.north east)[sharp corners]--(N.north west)--(N.south west)[rounded corners=\@Subsection@Radius]--(N.south east)--cycle;}
\fi
\draw[ColorA,line width=4.0pt,fill=white]([yshift=-\@Subsection@Radius]L.north east)circle(\@Subsection@Radius);
\node[circle,text=ColorA,inner sep=0mm,outer sep=0mm](Num)at([yshift=-\@Subsection@Radius]L.north east){\maxsizebox{2\@Subsection@Radius}{!}{\sffamily#3}};
\end{pgfonlayer}
\end{tikzpicture}}
%%%%
%%不编号小节标题样式%%
\newcommand{\subsectionsubtitle}[1]{\long\def\@subsectionsubtitle{#1}}
\subsectionsubtitle{}
%%%%
\NewDocumentCommand{\@SubsectionStarStyle}{ +m +m }{%
\noindent%
\begingroup%
\newdimen\@left@white@line@width
\@left@white@line@width=4.5pt%
\xllap{\@left@white@line@width}{%
\begin{tikzpicture}[use as bounding box]%
\SubsectionFont%
\newdimen\@Subsection@Star@Radius%
\newdimen\@Subsection@Star@BRadius%
\newdimen\@Subsection@Star@SRadius%
%%
\@Subsection@Star@Radius=\dimexpr\baselineskip/2\relax%0.9
\@Subsection@Star@BRadius=\dimexpr\baselineskip/2+\@left@white@line@width+2.0pt\relax%
\@Subsection@Star@SRadius=\dimexpr\baselineskip/2+2.0pt\relax%
%%
\pgfdeclarelayer{@Subsection@Star@Bottom}%
\pgfsetlayers{@Subsection@Star@Bottom,main}%
\node[text=white,font=\SubsectionFont,inner xsep=\@Subsection@Star@Radius,inner ysep=0mm,outer sep=0mm](L){%
\hspace*{\@Subsection@Star@Radius+0.5em}%
\begin{varwidth}{4.0cm}
\@change@minipage@footnote%
%\AdjustStrut{0.9}%
\strut#1\strut
\end{varwidth}};%
\pgfgetnodewidth(L)\@Subsection@Star@LabelWidth%
\pgfgetnodeheight(L)\@Subsection@Star@LabelHeight%
%%
\node[text=ColorA,font=\SubsectionFont,inner xsep=\@Subsection@Star@Radius,inner ysep=0mm,outer sep=0mm,anchor=north west](N)at(L.north east){%
\begin{minipage}{\linewidth-\@Subsection@Star@LabelWidth-2\@Subsection@Star@Radius-\@Subsection@Star@SRadius}
\@change@minipage@footnote%
%\AdjustStrut{0.9}%
\strut#2\strut
\end{minipage}};
\pgfgetnodeheight(N)\@Subsection@Star@NameHeight%
%%
\begin{pgfonlayer}{@Subsection@Star@Bottom}
\ifdim\@Subsection@Star@NameHeight>\@Subsection@Star@LabelHeight
\expandafter\ifblank\expandafter{#2}{\relax}{%
\path[fill=ColorB!7.5,rounded corners=\@Subsection@Star@Radius](L.north west)rectangle(N.south east);}
%
\path[fill=ColorA,rounded corners=\@Subsection@Star@Radius](L.north west)rectangle(N.south west);
\else
\expandafter\ifblank\expandafter{#2}{\relax}{%
\path[fill=ColorB!7.5,rounded corners=\@Subsection@Star@Radius](L.south west)rectangle(N.north east);}
%
\path[fill=ColorA,rounded corners=\@Subsection@Star@Radius](L.south west)rectangle(N.north west);
\fi
%%
\coordinate(CC)at([yshift=-\@Subsection@Star@Radius]L.north west);
\path[fill=white,sharp corners](CC)circle(\@Subsection@Star@BRadius);
\path[fill=ColorA](CC)circle(\@Subsection@Star@SRadius);
\draw[white,line width=4.0pt,fill=ColorA](CC)circle(2*\@Subsection@Star@Radius/3);
\end{pgfonlayer}
\end{tikzpicture}}%
\endgroup}

%%%%
%%编号小节样式%%
\titleformat{\subsection}[block]
{}{}{0mm}
{\@SubsectionStyle{\subsectionlabelfront}{#1}{\thesubsection}}
%%不编号小节样式%%
\titleformat{name=\subsection,numberless}[block]
{}{}{0mm}
{\@SubsectionStarStyle{#1}{\@subsectionsubtitle}}
[\global\subsectionsubtitle{}]%清空\subsectionsubtitle
%%间距设置%%
\titlespacing*{\subsection}{0pt}{1.5ex plus 0.5ex minus 0.2ex}{1ex plus 0.1ex}
%%page参数为标题占据一整页，不可以添加文字%%
%%top参数为标题在新的一页生成，可以添加文字%%
%%straight参数为标题与内容连续生成，不自动换页%%
\titleclass{\subsection}{straight}
%%%%
\NewCommandCopy{\OriginSubsection}{\subsection}
%%
\RenewDocumentCommand{\subsection}{s +O{#3} +m}{%
\IfBooleanTF{#1}{%
\OriginSubsection*{#3}}{%
\if@mainmatter%
\OriginSubsection[#2]{#3}%
\else%
\OriginSubsection*{\phantomsection\addcontentsline{toc}{subsection}{#2}#3}%
\fi}
}
%%%%
%%点样式%%
\titleformat{\subsubsection}[hang]{\color{ColorB}\SubsubsectionFont}{%
\tikz[baseline=-0.4em]{%
\begingroup%
\SubsubsectionFont%
\newdimen\@Subsubsection@LabelRadius%
%%
\@Subsubsection@LabelRadius=\dimexpr5\baselineskip/12\relax%
\node[outer sep=0mm,inner sep=0mm]{\@HalfCircle@Label{ColorB}{\@Subsubsection@LabelRadius}};
\endgroup}%
\hspace*{2.5mm}%
\subsubsectionlabelfront{\sffamily\thesubsubsection}\subsubsectionlabelback%
}{4.0mm}{#1}
%%
\titleformat{name=\subsubsection,numberless}[hang]{\color{ColorB}\SubsubsectionFont}{%
\tikz[baseline=-0.4em]{%
\begingroup%
\SubsubsectionFont%
\newdimen\@Subsubsection@LabelRadius%
%%
\@Subsubsection@LabelRadius=\dimexpr5\baselineskip/12\relax%
\node[outer sep=0mm,inner sep=0mm]{\@HalfCircle@Label{ColorB}{\@Subsubsection@LabelRadius}};
\endgroup}%
}{2.5mm}{#1}
%%间距设置%%
\titlespacing*{\subsubsection}{0pt}{5.0mm}{5.0mm}
%%page参数为标题占据一整页，不可以添加文字%%
%%top参数为标题在新的一页生成，可以添加文字%%
%%straight参数为标题与内容连续生成，不自动换页%%
\titleclass{\subsubsection}{straight}
%%%%
\NewCommandCopy{\OriginSubsubsection}{\subsubsection}
%%
\RenewDocumentCommand{\subsubsection}{s +O{#3} +m}{%
\IfBooleanTF{#1}{%
\OriginSubsubsection*{#3}}{%
\if@mainmatter%
\OriginSubsubsection[#2]{#3}%
\else%
\OriginSubsubsection*{\phantomsection\addcontentsline{toc}{subsubsection}{#2}#3}%
\fi}
}

%%修改段落样式%%
\renewcommand{\paragraph}{
\@startsection{paragraph}{4}{\z@}
{3.25ex \@plus1.0ex \@minus0.2ex}{-1.0em}
{\ParagraphNameFont\color{ColorA}}}
%%%%
%%练习标题设置%%
\NewDocumentCommand{\ComplexHeading}{m +m +m}{%
\begin{flushleft}%
\begin{tikzpicture}[use as bounding box]%
\SubsectionFont%
\newdimen\@ComplexHeading@Radius%
%%
\@ComplexHeading@Radius=\dimexpr\baselineskip/2\relax%
%%
\pgfdeclarelayer{@ComplexHeading@Bottom}%
\pgfsetlayers{@ComplexHeading@Bottom,main}%
\node[text=white,inner xsep=\@ComplexHeading@Radius,inner ysep=0mm,outer sep=0mm](L){%
\hspace*{\@ComplexHeading@Radius+0.5em}%
\begin{varwidth}{4.0cm}
\@change@minipage@footnote%
\strut#1\strut
\end{varwidth}};%
\pgfgetnodewidth(L)\@ComplexHeading@LabelWidth%
\pgfgetnodeheight(L)\@ComplexHeading@LabelHeight%
%%
\node[text=ColorB,inner xsep=\@ComplexHeading@Radius,inner ysep=0mm,outer sep=0mm,anchor=north west](N)at(L.north east){%
\begin{minipage}{\linewidth-\@ComplexHeading@LabelWidth-2\@ComplexHeading@Radius}
\@change@minipage@footnote%
\strut#2\strut
\end{minipage}};
\pgfgetnodeheight(N)\@ComplexHeading@NameHeight%
%%
\begin{pgfonlayer}{@ComplexHeading@Bottom}
\ifdim\@ComplexHeading@NameHeight>\@ComplexHeading@LabelHeight
\path[fill=ColorA!7.5,rounded corners=\@ComplexHeading@Radius](L.north west)rectangle(N.south east);
%
\path[fill=ColorB,rounded corners=\@ComplexHeading@Radius](L.north west)rectangle(N.south west);
\else
\path[fill=ColorA!7.5,rounded corners=\@ComplexHeading@Radius](L.south west)rectangle(N.north east);
%
\path[fill=ColorB,rounded corners=\@ComplexHeading@Radius](L.south west)rectangle(N.north west);
\fi
\end{pgfonlayer}%
\coordinate(C)at([xshift=\@ComplexHeading@Radius,yshift=-\@ComplexHeading@Radius]L.north west);
\draw[ColorB,fill=white](C)circle(\@ComplexHeading@Radius-2.5pt);
\node[circle,text=ColorB,inner sep=0mm,outer sep=0mm,font=\MainFont,align=center](F)at(C){#3};
\end{tikzpicture}%
\end{flushleft}%
\par
}
%%%%
\NewDocumentCommand{\AdjustiveHeading}{ +m }{
\begin{center}
\begin{tikzpicture}[use as bounding box]%
\HeadingFont%
\newdimen\@AdjustiveHeading@Radius%
%%
\@AdjustiveHeading@Radius=\dimexpr\baselineskip/2\relax%
%%
\pgfdeclarelayer{@AdjustiveHeading@Bottom}%
\pgfsetlayers{@AdjustiveHeading@Bottom,main}%
\node[draw=ColorB!75,fill=ColorB!75,rounded corners,text=white,outer sep=0mm,inner xsep=0.5em,inner ysep=0mm,align=center](E){%
\begin{varwidth}{\linewidth/2}
\@change@minipage@footnote%
\strut#1\strut
\end{varwidth}
};
\begin{pgfonlayer}{@AdjustiveHeading@Bottom}
\draw[ColorB!50,fill=ColorB!50,line width=6.0pt,rounded corners=\@AdjustiveHeading@Radius]([xshift=-\@AdjustiveHeading@Radius]E.north west)rectangle([xshift=\@AdjustiveHeading@Radius]E.south east);
\end{pgfonlayer}
\end{tikzpicture}
\end{center}
}
%%%%
%%索引分组标题样式%%
\NewDocumentCommand{\LongHeading}{+m}{%
\begin{center}%
\begin{tikzpicture}[use as bounding box]%
\HeadingFont%
\newdimen\@LongHeading@Radius%
\@LongHeading@Radius=\dimexpr\baselineskip/2\relax%
\node[text=ColorA,draw=ColorB!7.5,fill=ColorB!7.5,ultra thick,rounded corners=\@LongHeading@Radius,inner xsep=0mm,inner ysep=0mm,minimum width=\linewidth,align=center](P){\strut#1\strut};
\end{tikzpicture}%
\end{center}%
}
%%%%
%%习题标题设置%%
\NewDocumentCommand{\Exercise}{s +O{}}{%
\subsectionsubtitle{#2}
\IfBooleanTF{#1}{%
\subsection*{\exercisetitle}%
}{%
\subsection*{\exercisetitle%
\if@mainmatter%
~\sffamily\environmentmark\the@prenumber%
\fi}%
}%
}
%%%%
\NewDocumentCommand{\Thinking}{s +O{}}{%
\subsectionsubtitle{#2}
\IfBooleanTF{#1}{%
\subsection*{\thinkingtitle}%
}{%
\subsection*{\thinkingtitle%
\if@mainmatter%
~\sffamily\environmentmark\the@prenumber%
\fi}%
}%
}
%%%%
\NewDocumentCommand{\Improve}{s +O{}}{%
\subsectionsubtitle{#2}
\IfBooleanTF{#1}{%
\subsection*{\improvetitle}%
}{%
\subsection*{\improvetitle%
\if@mainmatter%
~\sffamily\thechapter%
\fi}%
}%
}
%%作业习题标题%%
\newcommand{\Basic}{%
\ComplexHeading{\basictitle}{\hfill\timetext\underline{\qquad}}{\faPen}%
}
\newcommand{\Complex}{%
\ComplexHeading{\complextitle}{\hfill\timetext\underline{\qquad}}{\faStar}%
}
%%笔记区域标题%%
\newcommand{\NoteArea}[1][0pt]{\marginnote{\LongHeading{\faArrowAltCircleDown~\notetitle}}[#1]}

%%模块标题%%
\newcommand{\Listening}{\AdjustiveHeading{\parbox{1.0em}{\faMusic}~~\listeningtitle}}
\newcommand{\Reading}{\AdjustiveHeading{\parbox{1.0em}{\faBookReader}~~\readingtitle}}
\newcommand{\Speaking}{\AdjustiveHeading{\parbox{1.0em}{\faMicrophone}~~\speakingtitle}}
\newcommand{\Writing}{\AdjustiveHeading{\parbox{1.0em}{\faPenNib}~~\writingtitle}}
%%%%
\newcommand{\Homework}{\section*{\homeworktitle}}

%%%%%%%%%%%%%%%%%% 环境、文档层次和目录 %%%%%%%%%%%%%%%%%%%%%
%%定义不同文档部分的页码标识%%
\def\@matter@page@mark{}
%%重新定义页码格式变更命令，引入页码标识%%
\def\pagenumbering#1{%
\global\c@page \@ne \gdef\thepage{\@matter@page@mark\csname @#1\endcsname
\c@page}}
%%重定义\frontmatter%%
\renewcommand{\frontmatter}[1][arabic]{%
\cleardoublepage%
\pagestyle{MainPage}%
\@mainmatterfalse%
\def\@matter@page@mark{F}%Front
\pagenumbering{#1}}
%%重定义\mainmatter%%
\renewcommand{\mainmatter}{%
\cleardoublepage%
\pagestyle{MainPage}%
\@mainmattertrue%
\def\@matter@page@mark{}%
\pagenumbering{arabic}}
%%重定义\backmatter%%
\renewcommand{\backmatter}[1][arabic]{%
\cleardoublepage%
\pagestyle{MainPage}%
\@mainmatterfalse%
\def\@matter@page@mark{B}%Back
\pagenumbering{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%以下为本文档类内置栏目，请谨慎修改%%
%%环境层级计数器：数值为1对应chapter，数值为2对应section%%
\newcounter{@Environment@Depth}
\setcounter{@Environment@Depth}{0}
%%
%%环境内计数器设置%%
\newcommand{\@StoreRelease@Value}[3]{
%在环境的开始位置将环境前的文档层次计数器值储存在outercounter中
%在环境的结束位置将环境内的文档层次计数器值储存在innercounter中
\setcounter{#2}{\value{#1}}
%随后立即将环境内的文档层次计数器值设置为innercounter的值
%随后立即将环境内的文档层次计数器值设置为outercounter的值
\setcounter{#1}{\value{#3}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@Toc@ChapLabel@Set}[2]{%
\def\chapterlabelfront{#1}%
\def\chapterlabelback{#2}%
\@Toc@ChapLabelLen@Set}
%%%%
%%修改环境内的章样式
\newcommand{\@Change@ChapterStyle@InEnv}[3]{%
%%修改环境内的计数器格式
\def\thechapter{#1}
%%将环境外的章节标签储存在临时变量中
\edef\@temp@chapterlabelfront{\chapterlabelfront}
\edef\@temp@chapterlabelback{\chapterlabelback}
%%修改环境内超链接唯一标识符
\def\theHchapter{\environmentmark\thechapter}
%%修改环境内和目录文件内的章节标签及其长度参数
\@Toc@ChapLabel@Set{#2}{#3}
\addtocontents{toc}{\protect\@Toc@ChapLabel@Set{#2}{#3}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@Toc@SecLabel@Set}[2]{%
\def\sectionlabelfront{#1}%
\def\sectionlabelback{#2}%
\@Toc@SecLabelLen@Set}
%%%%
%%修改环境内的节样式
\newcommand{\@Change@SectionStyle@InEnv}[3]{%
%%修改环境内的计数器格式
\def\thesection{#1}
%%将环境外的章节标签储存在临时变量中
\edef\@temp@sectionlabelfront{\sectionlabelfront}
\edef\@temp@sectionlabelback{\sectionlabelback}
%%修改环境内超链接唯一标识符
\def\theHsection{\environmentmark\the@prenumber}
%%修改环境内和目录文件内的章节标签及其长度参数
\@Toc@SecLabel@Set{#2}{#3}
\addtocontents{toc}{\protect\@Toc@SecLabel@Set{#2}{#3}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@Toc@SubsecLabel@Set}[2]{%
\def\subsectionlabelfront{#1}%
\def\subsectionlabelback{#2}%
\@Toc@SubsecLabelLen@Set}
%%%%
%%修改环境内的小节样式
\newcommand{\@Change@SubsectionStyle@InEnv}[3]{%
%%修改环境内的计数器格式
\def\thesubsection{#1}
%%将环境外的章节标签储存在临时变量中
\edef\@temp@subsectionlabelfront{\subsectionlabelfront}
\edef\@temp@subsectionlabelback{\subsectionlabelback}
%%修改环境内超链接唯一标识符
\def\theHsubsection{\environmentmark\the@prenumber.\thesubsection}
%%修改环境内和目录文件内的章节标签及其长度参数
\@Toc@SubsecLabel@Set{#2}{#3}
\addtocontents{toc}{\protect\@Toc@SubsecLabel@Set{#2}{#3}}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@Toc@SubsubLabel@Set}[2]{%
\def\subsubsectionlabelfront{#1}%
\def\subsubsectionlabelback{#2}%
\@Toc@SubsubLabelLen@Set}
%%%%
%%修改环境内的小小节样式
\newcommand{\@Change@SubsubsectionStyle@InEnv}[3]{%
%%修改环境内的计数器格式
\def\thesubsubsection{#1}
%%将环境外的章节标签储存在临时变量中
\edef\@temp@subsubsectionlabelfront{\subsubsectionlabelfront}
\edef\@temp@subsubsectionlabelback{\subsubsectionlabelback}
%%修改环境内超链接唯一标识符
\def\theHsubsubsection{\environmentmark\the@prenumber.\thesubsection.\thesubsubsection}
%%修改环境内和目录文件内的章节标签及其长度参数
\@Toc@SubsubLabel@Set{#2}{#3}
\addtocontents{toc}{\protect\@Toc@SubsubLabel@Set{#2}{#3}}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@Lof@Label@Set}[1]{\def\environmentmark{#1}}
%%%%
\newcommand{\@Lot@Label@Set}[1]{\def\environmentmark{#1}}
%%修改环境内的图表样式
\newcommand{\@Change@FigureTableStyle@InEnv}[1]{%
%%将环境外的章节标签储存在临时变量中
\edef\@temp@environmentmark{\environmentmark}
%%修改环境内和目录文件内的图表标签
\@Lof@Label@Set{#1}
\@Lot@Label@Set{#1}
\addtocontents{lof}{\protect\@Lof@Label@Set{#1}}
\addtocontents{lot}{\protect\@Lot@Label@Set{#1}}
%%修改环境内超链接唯一标识符
\def\theHfigure{\environmentmark\the@prenumber.\thefigure}
\def\theHfigure{\environmentmark\the@prenumber.\thetable}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%在环境末尾恢复章标签样式及其长度参数
\newcommand{\@Restore@ChapterLabel@OutEnv}{%
\addtocontents{toc}{\protect\@Toc@ChapLabel@Set{\@temp@chapterlabelfront}{\@temp@chapterlabelback}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%在环境末尾恢复节标签样式及其长度参数
\newcommand{\@Restore@SectionLabel@OutEnv}{%
\addtocontents{toc}{\protect\@Toc@SecLabel@Set{\@temp@sectionlabelfront}{\@temp@sectionlabelback}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%在环境末尾恢复小节标签样式及其长度参数
\newcommand{\@Restore@SubsectionLabel@OutEnv}{%
\addtocontents{toc}{\protect\@Toc@SubsecLabel@Set{\@temp@subsectionlabelfront}{\@temp@subsectionlabelback}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%在环境末尾恢复小小节标签样式及其长度参数
\newcommand{\@Restore@SubsubsectionLabel@OutEnv}{%
\addtocontents{toc}{\protect\@Toc@SubsubLabel@Set{\@temp@subsubsectionlabelfront}{\@temp@subsubsectionlabelback}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%在环境末尾恢复图表标签样式
\newcommand{\@Restore@FigureTableLabel@OutEnv}{%
\addtocontents{lof}{\protect\@Lof@Label@Set{\@temp@environmentmark}}
\addtocontents{lot}{\protect\@Lot@Label@Set{\@temp@environmentmark}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%定义在toc，lof，lot文件中添加空白行的命令，以便增加这些文件的可读性%%
\newcommand{\@AddBlankLine}{%
\addtocontents{toc}{}
\addtocontents{lof}{}
\addtocontents{lot}{}
}
%%设置附录章环境%%
\newcounter{@Outer@AppendixChap@Chapter}%环境外计数器
\newcounter{@Inner@AppendixChap@Chapter}%环境中计数器
%%
\newcounter{@Outer@AppendixChap@Section}%环境外计数器
\newcounter{@Inner@AppendixChap@Section}%环境中计数器
%%
\newcounter{@Outer@AppendixChap@Subsection}%环境外计数器
\newcounter{@Inner@AppendixChap@Subsection}%环境中计数器
%%
\newcounter{@Outer@AppendixChap@Subsubsection}%环境外计数器
\newcounter{@Inner@AppendixChap@Subsubsection}%环境中计数器
%%
\newenvironment{Appendix}{%
%%判断环境所在位置的环境层级计数器的数值，若为2，则说明本环境嵌套于一个section层级的环境中，需要报错；若为1，则说明本环境嵌套于另一个chapter层级的环境中，需要报错；若为0，则说明本环境不嵌套于任何一个类似的环境中，可以运行%%
\ifnum\value{@Environment@Depth}=2
\ClassError{textbook-cn}{The environment with depth=1 must not be used in the environment with depth=2!}{}
\else
\ifnum\value{@Environment@Depth}=1
\ClassError{textbook-cn}{The environment with depth=1 must not be used in the environment with depth=1!}{}
\else
\ifnum\value{@Environment@Depth}=0
\relax
\fi\fi\fi
%%设置环境层级
\setcounter{@Environment@Depth}{1}
%%计数器设置
\@StoreRelease@Value{chapter}{@Outer@AppendixChap@Chapter}{@Inner@AppendixChap@Chapter}
\@StoreRelease@Value{section}{@Outer@AppendixChap@Section}{@Inner@AppendixChap@Section}
\@StoreRelease@Value{subsection}{@Outer@AppendixChap@Subsection}{@Inner@AppendixChap@Subsection}
\@StoreRelease@Value{subsubsection}{@Outer@AppendixChap@Subsubsection}{@Inner@AppendixChap@Subsubsection}
%%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%%储存环境外的章节计数器、标签和图标标签，修改环境内的章节计数器、标签和图标标签，并修改超链接唯一标识符
\@AddBlankLine
\@Change@FigureTableStyle@InEnv{}
\@Change@ChapterStyle@InEnv{\Alph{chapter}}{附录}{}
\@Change@SectionStyle@InEnv{\alph{section}}{附节}{}
\@Change@SubsectionStyle@InEnv{\arabic{subsection}}{小节}{}
\@Change@SubsubsectionStyle@InEnv{\arabic{subsubsection}}{知识点}{}
%%简化序号命令
\renewcommand{\the@prenumber}{\thechapter.\thesection}
}{%
%%将环境层次计数器归零
\setcounter{@Environment@Depth}{0}
%%计数器设置
\@StoreRelease@Value{chapter}{@Inner@AppendixChap@Chapter}{@Outer@AppendixChap@Chapter}
\@StoreRelease@Value{section}{@Inner@AppendixChap@Section}{@Outer@AppendixChap@Section}
\@StoreRelease@Value{subsection}{@Inner@AppendixChap@Subsection}{@Outer@AppendixChap@Subsection}
\@StoreRelease@Value{subsubsection}{@Inner@AppendixChap@Subsubsection}{@Outer@AppendixChap@Subsubsection}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
%%重置目录中的标签
\@Restore@ChapterLabel@OutEnv
\@Restore@SectionLabel@OutEnv
\@Restore@SubsectionLabel@OutEnv
\@Restore@SubsubsectionLabel@OutEnv
\@Restore@FigureTableLabel@OutEnv
\@AddBlankLine
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%设置附录节环境%%
\newcounter{@Outer@AppendixSect@Section}%环境外计数器
\newcounter{@Inner@AppendixSect@Section}%环境中计数器
%%
\newcounter{@Outer@AppendixSect@Subsection}%环境外计数器
\newcounter{@Inner@AppendixSect@Subsection}%环境中计数器
%%
\newcounter{@Outer@AppendixSect@Subsubsection}%环境外计数器
\newcounter{@Inner@AppendixSect@Subsubsection}%环境中计数器
%%
\newenvironment{Appendix*}{%
%%判断环境所在位置的环境层级计数器的数值，若为2，则说明本环境嵌套于一个section层级的环境中，需要报错；若为0，则说明本环境不嵌套于任何一个类似的环境中，可以运行%%
\ifnum\value{@Environment@Depth}=2
\ClassError{textbook-cn}{The environment with depth=2 must not be used in the environment with depth=1!}{}
\else
\ifnum\value{@Environment@Depth}=1
\relax
\else
\ifnum\value{@Environment@Depth}=0
\relax
\fi\fi\fi
%%设置环境层级
\setcounter{@Environment@Depth}{2}
%移除section对chapter的依赖
\@removefromreset{section}{chapter}
%%计数器设置
\@StoreRelease@Value{section}{@Outer@AppendixSect@Section}{@Inner@AppendixSect@Section}
\@StoreRelease@Value{subsection}{@Outer@AppendixSect@Subsection}{@Inner@AppendixSect@Subsection}
\@StoreRelease@Value{subsubsection}{@Outer@AppendixSect@Subsubsection}{@Inner@AppendixSect@Subsubsection}
%%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%%储存环境外的章节计数器、标签和图标标签，修改环境内的章节计数器、标签和图标标签，并修改超链接唯一标识符
\@AddBlankLine
\@Change@SectionStyle@InEnv{\alph{section}}{附录}{}
\@Change@SubsectionStyle@InEnv{\arabic{subsection}}{小节}{}
\@Change@SubsubsectionStyle@InEnv{\arabic{subsubsection}}{知识点}{}
\@Change@FigureTableStyle@InEnv{}
%%简化序号命令
\renewcommand{\the@prenumber}{\thesection}
}{%
%%将环境层次计数器归零
\setcounter{@Environment@Depth}{0}
%%计数器设置
\@StoreRelease@Value{section}{@Inner@AppendixSect@Section}{@Outer@AppendixSect@Section}
\@StoreRelease@Value{subsection}{@Inner@AppendixSect@Subsection}{@Outer@AppendixSect@Subsection}
\@StoreRelease@Value{subsubsection}{@Inner@AppendixSect@Subsubsection}{@Outer@AppendixSect@Subsubsection}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
%添加section对chapter的依赖
\@addtoreset{section}{chapter}
%%重置目录中的标签
\@Restore@SectionLabel@OutEnv
\@Restore@SubsectionLabel@OutEnv
\@Restore@SubsubsectionLabel@OutEnv
\@Restore@FigureTableLabel@OutEnv
\@AddBlankLine
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%设置测验环境%%
\newcounter{@Outer@Quiz@Section}%环境外计数器
\newcounter{@Inner@Quiz@Section}%环境中计数器
%%
\newcounter{@Outer@Quiz@Subsection}%环境外计数器
\newcounter{@Inner@Quiz@Subsection}%环境中计数器
%%
\newcounter{@Outer@Quiz@Subsubsection}%环境外计数器
\newcounter{@Inner@Quiz@Subsubsection}%环境中计数器
%%
\newenvironment{Quiz}{%
%%判断环境所在位置的环境层级计数器的数值，若为2，则说明本环境嵌套于另一个同为section层级的环境中，需要报错；若为1，则说明本环境嵌套于另一个chapter层级的环境中，正常运行%%
\ifnum\value{@Environment@Depth}=2
\ClassError{textbook-cn}{The environment with depth=2 must not be used in the environment with depth=1!}{}
\else
\ifnum\value{@Environment@Depth}=1
\relax
\else
\ifnum\value{@Environment@Depth}=0
\relax
\fi\fi\fi
%%设置环境层级
\setcounter{@Environment@Depth}{2}
%移除section对chapter的依赖
\@removefromreset{section}{chapter}
%移除subsubsection对subsection的依赖
\@removefromreset{subsubsection}{subsection}
%添加subsubsection对section的依赖
\@addtoreset{subsubsection}{section}
%%计数器设置
\@StoreRelease@Value{section}{@Outer@Quiz@Section}{@Inner@Quiz@Section}
\@StoreRelease@Value{subsection}{@Outer@Quiz@Subsection}{@Inner@Quiz@Subsection}
\@StoreRelease@Value{subsubsection}{@Outer@Quiz@Subsubsection}{@Inner@Quiz@Subsubsection}
%%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%%储存环境外的章节计数器、标签和图标标签，并修改环境内的章节计数器、标签和图标标签
\@AddBlankLine
\@Change@SectionStyle@InEnv{\arabic{section}}{测验}{}
\@Change@SubsectionStyle@InEnv{\arabic{subsection}}{题组}{}
\@Change@SubsubsectionStyle@InEnv{\arabic{subsubsection}}{第}{题}
\@Change@FigureTableStyle@InEnv{Q}
%%简化序号命令
\renewcommand{\the@prenumber}{\thesection}
}{%
%%将环境层次计数器归零
\setcounter{@Environment@Depth}{0}
%%计数器设置
\@StoreRelease@Value{section}{@Inner@Quiz@Section}{@Outer@Quiz@Section}
\@StoreRelease@Value{subsection}{@Inner@Quiz@Subsection}{@Outer@Quiz@Subsection}
\@StoreRelease@Value{subsubsection}{@Inner@Quiz@Subsubsection}{@Outer@Quiz@Subsubsection}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
%移除subsubsection对section的依赖
\@removefromreset{subsubsection}{section}
%添加subsubsection对subsection的依赖
\@addtoreset{subsubsection}{subsection}
%添加section对chapter的依赖
\@addtoreset{section}{chapter}
%%重置目录中的标签
\@Restore@SectionLabel@OutEnv
\@Restore@SubsectionLabel@OutEnv
\@Restore@SubsubsectionLabel@OutEnv
\@Restore@FigureTableLabel@OutEnv
\@AddBlankLine
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%设置专题环境%%
\newcounter{@Outer@Topic@Section}%环境外计数器
\newcounter{@Inner@Topic@Section}%环境中计数器
%%
\newcounter{@Outer@Topic@Subsection}%环境外计数器
\newcounter{@Inner@Topic@Subsection}%环境中计数器
%%
\newcounter{@Outer@Topic@Subsubsection}%环境外计数器
\newcounter{@Inner@Topic@Subsubsection}%环境中计数器
%%
\newenvironment{Topic}{%
%%判断环境所在位置的环境层级计数器的数值，若为2，则说明本环境嵌套于另一个同为section层级的环境中，需要报错；若为1，则说明本环境嵌套于另一个chapter层级的环境中，正常运行%%
\ifnum\value{@Environment@Depth}=2
\ClassError{textbook-cn}{The environment with depth=2 must not be used in the environment with depth=1!}{}
\else
\ifnum\value{@Environment@Depth}=1
\relax
\else
\ifnum\value{@Environment@Depth}=0
\relax
\fi\fi\fi
%%设置环境层级
\setcounter{@Environment@Depth}{2}
%移除section对chapter的依赖
\@removefromreset{section}{chapter}
%%计数器设置
\@StoreRelease@Value{section}{@Outer@Topic@Section}{@Inner@Topic@Section}
\@StoreRelease@Value{subsection}{@Outer@Topic@Subsection}{@Inner@Topic@Subsection}
\@StoreRelease@Value{subsubsection}{@Outer@Topic@Subsubsection}{@Inner@Topic@Subsubsection}
%%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%%储存环境外的章节计数器、标签和图标标签，修改环境内的章节计数器、标签和图标标签，并修改超链接唯一标识符
\@AddBlankLine
\@Change@SectionStyle@InEnv{\arabic{section}}{专题}{}
\@Change@SubsectionStyle@InEnv{\arabic{subsection}}{考点}{}
\@Change@SubsubsectionStyle@InEnv{\arabic{subsubsection}}{知识点}{}
\@Change@FigureTableStyle@InEnv{T}
%%简化序号命令
\renewcommand{\the@prenumber}{\thesection}
}{%
%%将环境层次计数器归零
\setcounter{@Environment@Depth}{0}
%%计数器设置
\@StoreRelease@Value{section}{@Inner@Topic@Section}{@Outer@Topic@Section}
\@StoreRelease@Value{subsection}{@Inner@Topic@Subsection}{@Outer@Topic@Subsection}
\@StoreRelease@Value{subsubsection}{@Inner@Topic@Subsubsection}{@Outer@Topic@Subsubsection}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
%添加section对chapter的依赖
\@addtoreset{section}{chapter}
%%重置目录中的标签
\@Restore@SectionLabel@OutEnv
\@Restore@SubsectionLabel@OutEnv
\@Restore@SubsubsectionLabel@OutEnv
\@Restore@FigureTableLabel@OutEnv
\@AddBlankLine
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%设置课题环境%%
\newcounter{@Outer@Project@Section}%环境外计数器
\newcounter{@Inner@Project@Section}%环境中计数器
%%
\newcounter{@Outer@Project@Subsection}%环境外计数器
\newcounter{@Inner@Project@Subsection}%环境中计数器
%%
\newcounter{@Outer@Project@Subsubsection}%环境外计数器
\newcounter{@Inner@Project@Subsubsection}%环境中计数器
%%
\newenvironment{Project}{%
%%判断环境所在位置的环境层级计数器的数值，若为2，则说明本环境嵌套于另一个同为section层级的环境中，需要报错；若为1，则说明本环境嵌套于另一个chapter层级的环境中，正常运行%%
\ifnum\value{@Environment@Depth}=2
\ClassError{textbook-cn}{The environment with depth=2 must not be used in the environment with depth=1!}{}
\else
\ifnum\value{@Environment@Depth}=1
\relax
\else
\ifnum\value{@Environment@Depth}=0
\relax
\fi\fi\fi
%%设置环境层级
\setcounter{@Environment@Depth}{2}
%移除section对chapter的依赖
\@removefromreset{section}{chapter}
%%计数器设置
\@StoreRelease@Value{section}{@Outer@Project@Section}{@Inner@Project@Section}
\@StoreRelease@Value{subsection}{@Outer@Project@Subsection}{@Inner@Project@Subsection}
\@StoreRelease@Value{subsubsection}{@Outer@Project@Subsubsection}{@Inner@Project@Subsubsection}
%%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%%储存环境外的章节计数器、标签和图标标签，修改环境内的章节计数器、标签和图标标签，并修改超链接唯一标识符
\@AddBlankLine
\@Change@SectionStyle@InEnv{\arabic{section}}{课题}{}
\@Change@SubsectionStyle@InEnv{\arabic{subsection}}{活动}{}
\@Change@SubsubsectionStyle@InEnv{\arabic{subsubsection}}{知识点}{}
\@Change@FigureTableStyle@InEnv{P}
%%简化序号命令
\renewcommand{\the@prenumber}{\thesection}
}{%
%%将环境层次计数器归零
\setcounter{@Environment@Depth}{0}
%%计数器设置
\@StoreRelease@Value{section}{@Inner@Project@Section}{@Outer@Project@Section}
\@StoreRelease@Value{subsection}{@Inner@Project@Subsection}{@Outer@Project@Subsection}
\@StoreRelease@Value{subsubsection}{@Inner@Project@Subsubsection}{@Outer@Project@Subsubsection}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
%添加section对chapter的依赖
\@addtoreset{section}{chapter}
%%重置目录中的标签
\@Restore@SectionLabel@OutEnv
\@Restore@SubsectionLabel@OutEnv
\@Restore@SubsubsectionLabel@OutEnv
\@Restore@FigureTableLabel@OutEnv
\@AddBlankLine
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%标签绘制%%
\NewDocumentCommand{\@PartTocStyle}{ +m +m }{%
\begin{tikzpicture}[baseline,use as bounding box]%
\TocPartFont%
\newdimen\@PartToc@Radius%
%%
\@PartToc@Radius=\dimexpr\baselineskip/2\relax%0.9
%%
\pgfdeclarelayer{@PartToc@Bottom}%
\pgfsetlayers{@PartToc@Bottom,main}%
\node[text=white,inner xsep=\@PartToc@Radius,inner ysep=0mm,outer sep=0mm](L){%
\begin{varwidth}{6.0cm}
\@change@minipage@footnote%
%\AdjustStrut{0.9}%
\strut#1\strut
\end{varwidth}};
\pgfgetnodewidth(L)\@PartToc@LabelWidth
\pgfgetnodeheight(L)\@PartToc@LabelHeight
%%
\node[text=ColorA,inner xsep=\@PartToc@Radius,inner ysep=0mm,outer sep=0mm,minimum width=\linewidth-\@PartToc@LabelWidth,anchor=north west](N)at(L.north east){%
\begin{minipage}{\linewidth-\@PartToc@LabelWidth-2\@PartToc@Radius}
\@change@minipage@footnote%
%\AdjustStrut{0.9}%
\strut#2\strut
\end{minipage}};
\pgfgetnodeheight(N)\@PartToc@NameHeight
%%
\begin{pgfonlayer}{@PartToc@Bottom}
\ifdim\@PartToc@NameHeight>\@PartToc@LabelHeight
\path[fill=ColorB!7.5](N.north east)[sharp corners]--(N.north west)--(N.south west)[rounded corners=\@PartToc@Radius]--(N.south east)--cycle;
%
\path[fill=ColorA](L.north west)[sharp corners]--(L.north east)--(N.south west)[rounded corners=\@PartToc@Radius]--([xshift=-\@PartToc@LabelWidth]N.south west)--([xshift=-\@PartToc@LabelWidth,yshift=\@PartToc@LabelHeight]N.south west)--cycle;
\else
\path[fill=ColorB!7.5](N.north east)[sharp corners]--(N.north west)--(L.south east)[rounded corners=\@PartToc@Radius]--([yshift=-\@PartToc@LabelHeight]N.north east)--cycle;
%
\path[fill=ColorA](L.south west)[sharp corners]--(L.south east)--(L.north east)[rounded corners=\@PartToc@Radius]--(L.north west)--cycle;
\fi
\end{pgfonlayer}
\end{tikzpicture}}

%%%%
%%编号部分目录样式%%
\newlength{\@Toc@PartLabel@Wd}%部分标签的总宽度
%%定义目录中章标签相关的长度参数%%
\settowidth{\@Toc@PartLabel@Wd}{\TocPartFont\partlabelfront 99 \partlabelback}%用99占位代表一个两位数的宽度，数字前后的空格不可以删除
%%%%
\NewDocumentCommand{\@Toc@Part@Numbered}{+m}{%
\contentslabel[%
\@PartTocStyle{\makebox[\@Toc@PartLabel@Wd]{\partlabelfront\hfill{\sffamily\thecontentslabel}\hfill\partlabelback}}{#1\hfill\sffamily\thecontentspage}]%
{0mm}}
%%
%%不编号部分目录样式%%
\NewDocumentCommand{\@Toc@Part@Unnumbered}{+m}{%
\contentslabel[%
\@PartTocStyle{#1}{\hfill\sffamily\thecontentspage}]%
{0mm}}
%%
%%部分目录样式%%
\titlecontents{part}[0mm]{}
{\@Toc@Part@Numbered}
{\@Toc@Part@Unnumbered}{}
[\addvspace{5.0pt}]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\@Toc@LabelPage@Mgn}%标签左侧和页码右侧的空白距离
\newlength{\@Toc@LabelName@Sep}%目录标签和名称之间的空白距离
%%文档中有部分层次则有页码右侧的缩进距离，否则没有%%
\AtBeginDocument{%
\ifnum\totvalue{@Part@Number}>0%
\settowidth{\@Toc@LabelPage@Mgn}{\TocPartFont\hspace*{\baselineskip/2}}
\else
\setlength{\@Toc@LabelPage@Mgn}{0mm}
\fi}
\setlength{\@Toc@LabelName@Sep}{7.5mm}
%%
\contentsmargin{\@Toc@LabelPage@Mgn}%设置页码的边距
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\@Toc@ChapLabel@Wd}%章标签的总宽度，包括文字宽度和标签-名称之间的间距宽度
\newlength{\@Toc@ChapLabel@Ind}%章标签左侧的缩进距离
%%定义目录中章标签相关的长度参数%%
\newcommand{\@Toc@ChapLabelLen@Set}{%
\settowidth{\@Toc@ChapLabel@Wd}{\TocChapterFont\chapterlabelfront 99 \chapterlabelback}%用99占位代表一个两位数的宽度，数字前后的空格不可以删除
\addtolength{\@Toc@ChapLabel@Wd}{\@Toc@LabelName@Sep}
\setlength{\@Toc@ChapLabel@Ind}{\@Toc@ChapLabel@Wd+\@Toc@LabelPage@Mgn}
}
%%章目录样式%%
\AtBeginDocument{\@Toc@ChapLabelLen@Set}
\titlecontents{chapter}[\@Toc@ChapLabel@Ind]
{\TocChapterFont\color{ColorA}}
{\contentslabel[{\makebox[\@Toc@ChapLabel@Wd-\@Toc@LabelName@Sep]{\chapterlabelfront\hfill{\sffamily\thecontentslabel}\hfill\chapterlabelback}}]{\@Toc@ChapLabel@Wd}}
{\hspace*{-\@Toc@ChapLabel@Wd}}%不编号章节
{\hfill\ContentPageNumFont\thecontentspage}
[\addvspace{2.5pt}]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\@Toc@SecLabel@Wd}%节标签的总宽度，包括文字宽度和标签-名称之间的间距宽度
\newlength{\@Toc@SecLabel@Ind}%节标签左侧的缩进距离
%%定义目录中节标签相关的长度参数%%
\newcommand{\@Toc@SecLabelLen@Set}{%
\settowidth{\@Toc@SecLabel@Wd}{\TocSectionFont\sectionlabelfront 99 \sectionlabelback}%用99占位代表一个两位数的宽度，数字前后的空格不可以删除
\addtolength{\@Toc@SecLabel@Wd}{\@Toc@LabelName@Sep}
\setlength{\@Toc@SecLabel@Ind}{\@Toc@SecLabel@Wd+\@Toc@LabelPage@Mgn+5.0mm}
}
%%节目录样式%%
\AtBeginDocument{\@Toc@SecLabelLen@Set}
\titlecontents{section}[\@Toc@SecLabel@Ind]
{\TocSectionFont}
{\contentslabel[{\makebox[\@Toc@SecLabel@Wd-\@Toc@LabelName@Sep]{\sectionlabelfront\hfill{\sffamily\thecontentslabel}\hfill\sectionlabelback}}]{\@Toc@SecLabel@Wd}}
{\hspace*{-\@Toc@SecLabel@Wd}}%不编号章节
{\hfill\ContentPageNumFont\thecontentspage}
[\addvspace{2.5pt}]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\@Toc@SubsecLabel@Wd}%节标签的总宽度，包括文字宽度和标签-名称之间的间距宽度
\newlength{\@Toc@SubsecLabel@Ind}%节标签左侧的缩进距离
%%定义目录中小节标签相关的长度参数%%
\newcommand{\@Toc@SubsecLabelLen@Set}{%
\settowidth{\@Toc@SubsecLabel@Wd}{\TocSubsectionFont\subsectionlabelfront 99 \subsectionlabelback}%用99占位代表一个两位数的宽度，数字前后的空格不可以删除
\addtolength{\@Toc@SubsecLabel@Wd}{\@Toc@LabelName@Sep}
\setlength{\@Toc@SubsecLabel@Ind}{\@Toc@SubsecLabel@Wd+\@Toc@LabelPage@Mgn+10.0mm}
}
%%小节目录样式%%
\AtBeginDocument{\@Toc@SubsecLabelLen@Set}
\titlecontents{subsection}[\@Toc@SubsecLabel@Ind]
{\TocSubsectionFont}
{\contentslabel[{\makebox[\@Toc@SubsecLabel@Wd-\@Toc@LabelName@Sep]{\subsectionlabelfront\hfill{\sffamily\thecontentslabel}\hfill\subsectionlabelback}}]{\@Toc@SubsecLabel@Wd}}
{\hspace*{-\@Toc@SubsecLabel@Wd}}%不编号章节
{\hfill\ContentPageNumFont\thecontentspage}
[\addvspace{2.5pt}]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\@Toc@SubsubLabel@Wd}%节标签的总宽度，包括文字宽度和标签-名称之间的间距宽度
\newlength{\@Toc@SubsubLabel@Ind}%节标签左侧的缩进距离
%%定义目录中小小节标签相关的长度参数%%
\newcommand{\@Toc@SubsubLabelLen@Set}{%
\settowidth{\@Toc@SubsubLabel@Wd}{\TocSubsubsectionFont\subsubsectionlabelfront 99 \subsubsectionlabelback}%用99占位代表一个两位数的宽度，数字前后的空格不可以删除
\addtolength{\@Toc@SubsubLabel@Wd}{\@Toc@LabelName@Sep}
\setlength{\@Toc@SubsubLabel@Ind}{\@Toc@SubsubLabel@Wd+\@Toc@LabelPage@Mgn+15.0mm}
}
%%小小节目录样式%%
\AtBeginDocument{\@Toc@SubsubLabelLen@Set}
\titlecontents{subsubsection}[\@Toc@SubsubLabel@Ind]
{\TocSubsubsectionFont}
{\contentslabel[{\makebox[\@Toc@SubsubLabel@Wd-\@Toc@LabelName@Sep]{\subsubsectionlabelfront\hfill{\sffamily\thecontentslabel}\hfill\subsubsectionlabelback}}]{\@Toc@SubsubLabel@Wd}}
{\hspace*{-\@Toc@SubsubLabel@Wd}}%不编号章节
{\hfill\ContentPageNumFont\thecontentspage}
[\addvspace{2.5pt}]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\@Loft@LabelName@Sep}
\setlength{\@Loft@LabelName@Sep}{7.5mm}
%%
\newlength{\@Lof@Label@Wd}%节标签的总宽度，包括文字宽度和标签-名称之间的间距宽度
\newlength{\@Lof@Label@Ind}%节标签左侧的缩进距离
%%定义目录中小小节标签相关的长度参数%%
\newcommand{\@Lof@LabelLen@Set}{%
\settowidth{\@Lof@Label@Wd}{\LoftFont\figurename 99.99.99}
\addtolength{\@Lof@Label@Wd}{\@Loft@LabelName@Sep}
\setlength{\@Lof@Label@Ind}{\@Lof@Label@Wd}
}
%%图片目录样式%%
\AtBeginDocument{\@Lof@LabelLen@Set}
\addtocontents{lof}{\protect\setlength\protect{\@Toc@LabelPage@Mgn}{0mm}}%在目录文件lof中设置右边距（即页码边距）为0
\titlecontents{figure}[\@Lof@Label@Ind]
{\LoftFont}
{\contentslabel[{\makebox[\@Lof@Label@Wd-\@Loft@LabelName@Sep]{\figurename\hfill{\sffamily\environmentmark\thecontentslabel}}}]{\@Lof@Label@Wd}}
{\hspace*{-\@Lof@Label@Wd}}%不编号图表
{\hfill\ContentPageNumFont\thecontentspage}
[\addvspace{2.5pt}]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\@Lot@Label@Wd}%节标签的总宽度，包括文字宽度和标签-名称之间的间距宽度
\newlength{\@Lot@Label@Ind}%节标签左侧的缩进距离
%%定义目录中小小节标签相关的长度参数%%
\newcommand{\@Lot@LabelLen@Set}{%
\settowidth{\@Lot@Label@Wd}{\LoftFont\tablename 99.99.99}
\addtolength{\@Lot@Label@Wd}{\@Loft@LabelName@Sep}
\setlength{\@Lot@Label@Ind}{\@Lot@Label@Wd}
}
%%表格目录样式%%
\AtBeginDocument{\@Lot@LabelLen@Set}
\addtocontents{lot}{\protect\setlength\protect{\@Toc@LabelPage@Mgn}{0mm}}%在目录文件lot中设置右边距（即页码边距）为0
\titlecontents{table}[\@Lot@Label@Ind]
{\LoftFont}
{\contentslabel[{\makebox[\@Lot@Label@Wd-\@Loft@LabelName@Sep]{\tablename\hfill{\sffamily\environmentmark\thecontentslabel}}}]{\@Lot@Label@Wd}}
{\hspace*{-\@Lot@Label@Wd}}%不编号图表
{\hfill\ContentPageNumFont\thecontentspage}
[\addvspace{2.5pt}]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%部分页上的小目录章样式%%
\titlecontents{lchapter}[0.75cm]
{\color{ColorB}\TocLChapterFont}
{\color{ColorB}\contentslabel[\TocLChapterFont\faGenderless]{0.5cm}}
{\color{ColorB}\contentslabel[\TocLChapterFont\faGenderless]{0.5cm}}%不编号章节
{}[\addvspace{5.0pt}]
%%部分页上的小目录节样式%%
\titlecontents{lsection}[0.9cm]
{\color{ColorB}\TocLSectionFont}
{\contentslabel[\TocLSectionFont\faGenderless]{0.5cm}}
{\contentslabel[\TocLSectionFont\faGenderless]{0.5cm}}%不编号章节
{}[\addvspace{5.0pt}]
%%部分页上的小目录小节样式%%
\titlecontents{lsubsection}[1.05cm]
{\color{ColorB}\TocLSubsectionFont}
{\contentslabel[\TocLSubsectionFont\faGenderless]{0.5cm}}
{\contentslabel[\TocLSubsectionFont\faGenderless]{0.5cm}}%不编号章节
{}[\addvspace{5.0pt}]
%%部分页上的小目录小小节样式%%
\titlecontents{lsubsubsection}[1.2cm]
{\color{ColorB}\TocLSubsubsectionFont}
{\contentslabel[\TocLSubsubsectionFont\faGenderless]{0.5cm}}
{\contentslabel[\TocLSubsubsectionFont\faGenderless]{0.5cm}}%不编号章节
{}[\addvspace{5.0pt}]
%%%%
%%部分页上的小图目录样式%%
\titlecontents{lfigure}[0.9cm]
{\color{ColorB}\TocLSectionFont}
{\contentslabel[\LoftLFont\faGenderless]{0.5cm}}
{\contentslabel[\LoftLFont\faGenderless]{0.5cm}}%不编号章节
{}[\addvspace{5.0pt}]
%%部分页上的小图目录样式%%
\titlecontents{ltable}[0.9cm]
{\color{ColorB}\TocLSectionFont}
{\contentslabel[\LoftLFont\faGenderless]{0.5cm}}
{\contentslabel[\LoftLFont\faGenderless]{0.5cm}}%不编号章节
{}[\addvspace{5.0pt}]

%%%%%%%%%%%%%%%%%% 例题与盒子定义 %%%%%%%%%%%%%%%%%%%%%%%%
%%设置例题和定义盒子序号前缀%%
\newcommand{\environmentmark}{}
%%设置例题命令%%
\NewDocumentCommand{\@ExampleStyle}{ +m +m m }{%
\noindent%
\raisebox{-0.4em}{%
\begin{tikzpicture}
\EgLabelFont%
\newdimen\@Example@Radius%
%%
\@Example@Radius=\dimexpr\baselineskip/2\relax%0.75
%%
\pgfdeclarelayer{@Example@Bottom}%
\pgfsetlayers{@Example@Bottom,main}%
\node[text=white,inner sep=0mm,outer sep=0mm](L){%
\hspace*{\@Example@Radius}%
\begin{varwidth}{3.0cm}
\@change@minipage@footnote%
%\AdjustStrut{0.75}%
\strut#1\strut
\end{varwidth}%
\hspace*{\@Example@Radius}%
};
\pgfgetnodewidth(L)\@Example@LabelWidth
\pgfgetnodeheight(L)\@Example@LabelHeight
%%
\node[text=#3,inner xsep=\@Example@Radius,inner ysep=0mm,outer sep=0mm,anchor=north west](N)at(L.north east){%
\begin{varwidth}{2.0cm}
\@change@minipage@footnote%
%\AdjustStrut{0.75}%
\strut\sffamily#2\strut
\end{varwidth}};
\pgfgetnodeheight(N)\@Example@NameHeight
%%
\begin{pgfonlayer}{@Example@Bottom}
\ifdim\@Example@NameHeight>\@Example@LabelHeight
\draw[#3,ultra thick,fill=#3,rounded corners=\@Example@Radius](L.north west)rectangle(N.south east);
%
\draw[#3,ultra thick,fill=white,rounded corners=\@Example@Radius](N.north west)rectangle(N.south east);
\else
\draw[#3,ultra thick,fill=#3,rounded corners=\@Example@Radius](L.south west)rectangle(N.north east);
%
\draw[#3,ultra thick,fill=white,rounded corners=\@Example@Radius](L.south east)rectangle(N.north east);
\fi
\end{pgfonlayer}
\end{tikzpicture}}
}
%%%%
\NewDocumentCommand{\@AnswerStyle}{ +m m }{%
\noindent%
\tikz[baseline=-0.4em]{%
\begingroup%
\EgLabelFont%
\newdimen\@Answer@Radius%
\@Answer@Radius=\dimexpr\baselineskip/2\relax%0.75
\node[draw=#2,fill=#2,rounded corners=\@Answer@Radius,ultra thick,text=white,inner xsep=\@Answer@Radius,inner ysep=0mm,outer sep=0mm](L){%
\begin{varwidth}{3.0cm}
\@change@minipage@footnote%
%\AdjustStrut{0.75}%
\strut#1\strut
\end{varwidth}};%
\endgroup}
}
%%%%
%%解答%%
\NewDocumentEnvironment{Answer}{+O{}}{%
\medskip%
\colorlet{ListColor}{ColorG}%
\@AnswerStyle{\answertitle}{ColorG}%
\hspace*{0.5em}\vspace*{0.25em}%
{\color{ColorG}\bfseries #1~~}%
}{\par\medskip}
%%%%
\NewDocumentEnvironment{Answer*}{+O{}}{%
\medskip%
\colorlet{ListColor}{ColorF}%
\@AnswerStyle{\analysistitle}{ColorF}%
\hspace*{0.5em}\vspace*{0.25em}%
{\color{ColorG}\bfseries #1~~}%
}{\par\medskip}

%%%%
%%例题%%
\NewDocumentEnvironment{Example}{+O{}}{%
\medskip%
\colorlet{ListColor}{ColorA}%
\if@mainmatter%
\stepcounter{@example}%
\@ExampleStyle{\exampletitle}{\environmentmark\the@prenumber.\the@example}{ColorA}%
\else%
\@AnswerStyle{\exampletitle}{ColorA}%
\fi%
\hspace*{0.5em}\vspace*{0.25em}%
{\color{ColorA}\bfseries #1~~}%
}{\par\medskip}
%%%%
\NewDocumentEnvironment{Example*}{+O{}}{%
\medskip%
\colorlet{ListColor}{ColorA}%
\@AnswerStyle{\exampletitle}{ColorA}%
\hspace*{0.5em}\vspace*{0.25em}%
{\color{ColorA}\bfseries #1~~}%
}{\par\medskip}

%%变式%%
\NewDocumentEnvironment{Variant}{+O{}}{%
\medskip%
\colorlet{ListColor}{ColorB}%
\if@mainmatter%
\stepcounter{@variant}%
\@ExampleStyle{\varianttitle}{\environmentmark\the@prenumber.\the@variant}{ColorB}%
\else%
\@AnswerStyle{\varianttitle}{ColorB}%
\fi%
\hspace*{0.5em}\vspace*{0.25em}%
{\color{ColorB}\bfseries #1~~}%
}{\par\medskip}
%%%%
\NewDocumentEnvironment{Variant*}{+O{}}{%
\medskip%
\colorlet{ListColor}{ColorB}%
\@AnswerStyle{\varianttitle}{ColorB}%
\hspace*{0.5em}\vspace*{0.25em}%
{\color{ColorB}\bfseries #1~~}%
}{\par\medskip}

%%%%
%%设置注释盒子样式%%
\tcbset{NoteBox/.style args={#1/#2}{
empty,%breakable,%边注内盒子不要加载此参数，会导致行距异常
code={\colorlet{ListColor}{#2}},
boxsep=0mm,
top=0mm,bottom=0mm,left=0mm,right=0mm,
bottomtitle=2.5mm,
before=\par\medskip,after=\par\medskip,
fonttitle=\BoxTitleFont,coltitle=#2,
colupper=#2,collower=#2,
title={\strut#1\strut},
before title={\@change@minipage@footnote},
before upper={\setlength{\parindent}{2.0em}%
\@change@minipage@footnote},
before lower={\setlength{\parindent}{2.0em}%
\@change@minipage@footnote},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#2,top=0mm,bottom=0mm},
segmentation engine=path,
segmentation style={cap=round,draw=#2!25,loosely dashed},
segmentation at break=false
}}

%%%%
\tcbset{ItemBox/.style args={#1/#2}{
empty,breakable,
code={\colorlet{ListColor}{#2}},
boxsep=3.0mm,
top=2.0mm,bottom=-3.0mm,left=-3.0mm,right=-3.0mm,
varwidth boxed title={2\linewidth/3},
before upper={\setlength{\parindent}{2.0em}
\@change@minipage@footnote},
before lower={\setlength{\parindent}{2.0em}
\@change@minipage@footnote},
before=\par\medskip,after=\par\medskip,
fontupper=\ItemFont,fontlower=\ItemFont,
fonttitle=\BoxTitleFont,coltitle=white,
title={%
%\AdjustStrut{0.85}
\strut#1\strut%
},
before title={\@change@minipage@footnote},
attach boxed title to top left={yshift*=-\tcboxedtitleheight},
boxed title style={size=minimal,empty,valign=center,left=2.25em,right=1.0em},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#2,top=-3.0mm,bottom=-3.0mm},
segmentation engine=path,
segmentation style={cap=round,line width=2.25pt,draw=#2!25,loosely dashed},
segmentation at break=false,
%%%%
underlay boxed title={%
\BoxTitleFont%
\newdimen\@BoxTitle@Radius%
\@BoxTitle@Radius=\dimexpr\baselineskip/2\relax%0.85
\draw[#2,fill=#2,ultra thick,rounded corners=\@BoxTitle@Radius](title.north west)rectangle(title.south east);
\path[fill=white]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle(\@BoxTitle@Radius-2.0pt);
\path[fill=#2]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle(\@BoxTitle@Radius/2);
%%%%
\draw[#2,fill=#2,ultra thin]([xshift=-\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]frame.north east)circle({2*\@BoxTitle@Radius/3});
\draw[#2!90,fill=#2!90,ultra thin]([xshift=-3*\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]frame.north east)circle({2*\@BoxTitle@Radius/3});
\draw[#2!80,fill=#2!80,ultra thin]([xshift=-5*\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]frame.north east)circle({2*\@BoxTitle@Radius/3});}
}}

%%设置彩色盒子样式%%
\tcbset{ColorfulBox/.style args={#1/#2/#3/#4}{%
enhanced standard,breakable,
pad after break=5.0mm,
grow to left by=-2.0pt,
rounded corners,arc=5.0pt,boxrule=2.25pt,
colback=white,colframe=#4!75,%colframe=white,
%frame style={left color=#4!50,right color=#4!50,middle color=#4},
code={\colorlet{ListColor}{#4}},
boxsep=3.0mm,
top=1.5mm,bottom=1.5mm,left=2.0mm,right=2.0mm,
varwidth boxed title={2\linewidth/3},
before=\par\bigskip,after=\par\bigskip,
fonttitle=\BoxTitleFont,coltitle=white,
title={\strut#1\strut},
before title={\@change@minipage@footnote},
IfBlankTF={#2}{}{after title={\strut~:~~#2\strut}},
attach boxed title to top left={yshift*=-\tcboxedtitleheight+1.5mm},
boxed title style={size=minimal,empty,valign=center,left=2.5em,right=1.0em},
IfBlankTF={#3}{
before upper={\setlength{\parindent}{2.0em}%
\@change@minipage@footnote}
}{before upper={\setlength{\parindent}{2.0em}%
\noindent{\BoxTitleFont\color{#4}#3}\hspace{1.0em}%
\@change@minipage@footnote}
},
before lower={\setlength{\parindent}{2.0em}%
\@change@minipage@footnote},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#4,top=-3.0mm,bottom=-3.0mm},
segmentation style={cap=round,line width=2.25pt,draw=#4!25,solid,shorten <= 5.0mm,shorten >= 5.0mm},
segmentation at break=false
}}
%%%%
\tcbset{CodeBox/.style args={#1/#2/#3/#4/#5}{
enhanced standard,breakable,
pad after break=5.0mm,
rounded corners,arc=5.0pt,boxrule=2.25pt,
colback=white,colframe=#4!75,%colframe=white,
%frame style={left color=#4!50,right color=#4!50,middle color=#4},
boxsep=3.0mm,
top=1.5mm,bottom=1.5mm,left=2.0em+0.5mm,right=2.0mm,
before=\par\bigskip,after=\par\bigskip,
IfEmptyTF={#3}{
before upper={\setlength{\parindent}{2.0em}%
\@change@minipage@footnote}
}{before upper={\setlength{\parindent}{2.0em}%
\noindent{\BoxTitleFont\color{#4}#3}\hspace{1.0em}%
\@change@minipage@footnote}
},
before lower={\setlength{\parindent}{2.0em}%
\@change@minipage@footnote},
fonttitle=\BoxTitleFont,coltitle=white,
varwidth boxed title={2\linewidth/3},
title={\strut#1\strut},
before title={\@change@minipage@footnote},
IfBlankTF={#2}{}{after title={\strut~:~~#2\strut}},
boxed title style={size=minimal,empty,left=1.2em,right=1.2em,top=0.25em,bottom=0.05em},
attach boxed title to top left={yshift*=-\tcboxedtitleheight},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#4,top=-3.0mm,bottom=-3.0mm},
segmentation style={cap=round,line width=2.25pt,draw=#4!25,solid,shorten <= 2.0em+3.5mm,shorten >= 5.0mm},
segmentation at break=false,
%%%%
underlay boxed title={%
\BoxTitleFont%
\newdimen\@BoxTitle@Radius%
\@BoxTitle@Radius=\dimexpr\baselineskip/2\relax%0.85
\begin{tcbclipinterior}
\path[fill=#4!7.5](frame.south west)rectangle([xshift=2.0em]frame.north west);
\path[fill=#4!7.5](frame.north east)rectangle(title.south west);
\path[fill=#4](title.north west)--(title.north east)[rounded corners=5.0pt]--(title.south east)[sharp corners]--(title.south west)--cycle;
\end{tcbclipinterior}
\node[font=\BoxTitleFont,text=#4,anchor=east,outer sep=0mm,inner xsep=5.0mm](ST)at([yshift={-\tcboxedtitleheight/2}]interior.north east){
\begin{varwidth}{\linewidth/3}
\@change@minipage@footnote%
#5
\end{varwidth}};},
overlay middle and last={
\begin{tcbclipinterior}
\path[fill=#4!7.5](frame.south west)rectangle([xshift=1.9em]frame.north west);
\end{tcbclipinterior}},
code={\setlength{\linenumbersep}{7.5mm}%修改行号与正文的间距
\colorlet{ListColor}{#4}%
\renewcommand{\linenumberfont}{\LineNumFont\color{#4}}%
}
}}
%%%%
\tcbset{BlockBox/.style args={#1}{
enhanced standard,breakable,
pad after break=5.0mm,
boxsep=3.0mm,
top=1.5mm,bottom=1.5mm,left=2.0mm,right=2.0mm,
bottomtitle=-4.5mm,
colframe=ColorB!7.5,colback=ColorB!7.5,colbacktitle=ColorB!7.5,rounded corners,arc=7.5pt,
before=\par\medskip,after=\par\medskip,
before upper={\setlength{\parindent}{2.0em}%
\@change@minipage@footnote},
before lower={\setlength{\parindent}{2.0em}%
\@change@minipage@footnote},
fonttitle=\BoxTitleFont,coltitle=ColorA,
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=ColorA,top=-3.0mm,bottom=-3.0mm},
segmentation style={cap=round,line width=2.25pt,draw=ColorA!25,solid,shorten <= 5.0mm,shorten >= 5.0mm,loosely dashed},
segmentation at break=false,
IfBlankTF={#1}{}{title={\strut#1\strut}},
before title={\@change@minipage@footnote},
overlay={%
\begin{tcbclipinterior}
\node[inner sep=0mm,anchor=south east]at([yshift=5.0mm]interior.south east){\Clover[ColorB!15][0.25]};
\end{tcbclipinterior}}
}}
%%%%
\tcbset{FoldBox/.style args={#1}{%
enhanced standard,breakable,
pad after break=5.0mm,
colback=ColorB!7.5,colframe=ColorB!7.5,
boxsep=3.0mm,
top=1.5mm,bottom=1.5mm,left=2.0mm,right=2.0mm,
varwidth boxed title={2\linewidth/3},
before=\par\bigskip,after=\par\bigskip,
fonttitle=\BoxTitleFont,coltitle=ColorA,
title={\strut#1\strut},
before title={\@change@minipage@footnote},
attach boxed title to top left,
boxed title style={size=minimal,empty,valign=center,boxsep=3.0mm,left=2.0mm,right=2.0mm,top=-1.0mm,bottom=-4.0mm},
before upper={\setlength{\parindent}{2.0em}%
\@change@minipage@footnote},
before lower={\setlength{\parindent}{2.0em}%
\@change@minipage@footnote},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=ColorA,top=-3.0mm,bottom=-3.0mm},
segmentation style={cap=round,line width=2.25pt,draw=ColorA!25,solid,shorten <= 5.0mm,shorten >= 5.0mm},
segmentation at break=false,
underlay boxed title={%
\path[draw=ColorB!7.5,fill=ColorB!7.5,rounded corners=7.5pt](title.north west)--(title.north east)--([xshift=5.0mm]title.south east)--(frame.north east)--(frame.south east)--(frame.south west)--cycle;},
overlay={%
\begin{tcbclipinterior}
\node[inner sep=0mm,anchor=south east]at([yshift=5.0mm]interior.south east){\Clover[ColorB!15][0.25]};
\end{tcbclipinterior}}
}}

%%设置节前盒子%%
%盒子内脚注设置，使得脚注位于页面最下方而不是盒子最下方
\makesavenoteenv{box0}
%%
\DeclareTColorBox{box0}{O{} +m O{ColorB}}{ItemBox=#2/#3,#1}

\newenvironment{Point}{\begin{box0}{\chapterpointtitle}[ColorA]}{\end{box0}}
\newenvironment{Point*}{\begin{box0}{\sectionpointtitle}[ColorA]}{\end{box0}}

\newenvironment{Case}{\begin{box0}{\concepttitle}[ColorB]}{\end{box0}}
\newenvironment{Case*}{\begin{box0}{\outlinetitle}[ColorB]}{\end{box0}}
%%%%

%%设置易错点盒子%%
%盒子内脚注设置，使得脚注位于页面最下方而不是盒子最下方
\makesavenoteenv{box1}
%%
\DeclareTColorBox{box1}{+O{} +m +O{} +O{} O{ColorA} O{\faQuestion}}{
ColorfulBox=#2/#3/#4/#5,
%%%%
underlay boxed title={%
\begingroup%
\BoxTitleFont%
\newdimen\@BoxTitle@Radius%
\@BoxTitle@Radius=\dimexpr\baselineskip/2\relax%0.85
\draw[white,fill=white,rounded corners=\@BoxTitle@Radius,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#5,fill=#5,ultra thick,rounded corners=\@BoxTitle@Radius](title.north west)rectangle(title.south east);
%%%%
\draw[white,fill=white,line width=10.0pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle(\@BoxTitle@Radius);
\draw[#5,fill=#5,line width=2.75pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle(\@BoxTitle@Radius);
%%%%
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=white](P)at([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west){#6};
\endgroup},
#1}

%%%%
\DeclareDocumentEnvironment{Warning}{ +O{} +O{} }{\begin{box1}{\warningtitle}[#1][#2][ColorF][\faExclamation]}{\end{box1}}
\DeclareDocumentEnvironment{Discussion}{ +O{} +O{}}{\begin{box1}[lowerbox=ignored]{\discussiontitle}[#1][#2][ColorC][\faQuestion]}
{\end{box1}}
\DeclareDocumentEnvironment{Check}{ +O{} +O{} }{\begin{box1}[phantom={%
\if@mainmatter%
\refstepcounter{@check}
\fi}]{\checktitle%
\if@mainmatter%
{\sffamily\the@check}%
\fi}[#1][#2][ColorI][\faCheck]}
{\end{box1}}
%%
\DeclareDocumentEnvironment{Check*}{ +O{} +O{} }{\begin{box1}{\checktitle}[#1][#2][ColorI][\faCheck]}
{\end{box1}}

%%设置演示盒子%%
%盒子内脚注设置，使得脚注位于页面最下方而不是盒子最下方
\makesavenoteenv{box2}
%%
\DeclareTColorBox{box2}{+O{} +m +O{} +O{} O{ColorA} O{\faLayerGroup}}{
ColorfulBox=#2/#3/#4/#5,
%%%%
underlay boxed title={%
\begingroup%
\BoxTitleFont%
\newdimen\@BoxTitle@Radius%
\@BoxTitle@Radius=\dimexpr\baselineskip/2\relax%0.85
\draw[white,fill=white,line width=10.0pt,rounded corners=\@BoxTitle@Radius](title.north east)rectangle(title.south west);
%%%%
\path[fill=white]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({5*\@BoxTitle@Radius/3});
\draw[#5,fill=#5!90,line width=2.0pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({8*\@BoxTitle@Radius/7});
%%%%
\pgfgetnodeheight(title)\@BoxTitle@Height
\ifdim\@BoxTitle@Height>2\@BoxTitle@Radius
\draw[#5,fill=#5!90,line width=2.0pt]
(title.north east)[sharp corners]--
([xshift={7*\@BoxTitle@Radius/3}]title.north west)arc(asin(3/5):{-asin(3/5)-90}:{5*\@BoxTitle@Radius/3})[rounded corners=\@BoxTitle@Radius]--
(title.south west)[rounded corners=\@BoxTitle@Radius]--
(title.south east)[rounded corners=\@BoxTitle@Radius]--cycle;
\else
%%%%
\draw[#5,fill=#5!90,line width=2.0pt]
(title.north east)[sharp corners]--
([xshift={7*\@BoxTitle@Radius/3}]title.north west)arc(asin(3/5):-asin(3/5):{5*\@BoxTitle@Radius/3})[rounded corners=\@BoxTitle@Radius]--
(title.south east)[rounded corners=\@BoxTitle@Radius]--cycle;
\fi
%%%%
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=white](T)at([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west){#6};
\endgroup},
#1}

%%%%
\DeclareDocumentEnvironment{Display}{ +O{} +O{} }{\begin{box2}{\displaytitle}[#1][#2][ColorB][\faLayerGroup]}{\end{box2}}
\DeclareDocumentEnvironment{Method}{ +O{} +O{} }{\begin{box2}{\methodtitle}[#1][#2][ColorD][\faPodcast]}{\end{box2}}
\DeclareDocumentEnvironment{Mind}{ +O{} +O{} }{\begin{box2}{\mindtitle}[#1][#2][ColorC][\faAtom]}{\end{box2}}

%%简化序号命令%%
\newcommand{\the@prenumber}{\thechapter.\thesection}
%%设置定义定理盒子%%
%盒子内脚注设置，使得脚注位于页面最下方而不是盒子最下方
\makesavenoteenv{box3}
%%
\DeclareTColorBox{box3}{+O{} +m +O{} +O{} O{ColorA} O{\faCodepen}}{
ColorfulBox=#2/#3/#4/#5,
%%%%
underlay boxed title={%
\begingroup%
\BoxTitleFont%
\newdimen\@BoxTitle@Radius%
\@BoxTitle@Radius=\dimexpr\baselineskip/2\relax%0.85
\pgfgetnodeheight(title)\@BoxTitle@Height
\ifdim\@BoxTitle@Height>2\@BoxTitle@Radius
\draw[white,fill=white,line width=10.0pt](title.north east)--([xshift={sqrt(15)*\@BoxTitle@Radius/7+\@BoxTitle@Radius}]title.north west)arc(asin(7/8):{270-asin(7/8)}:{8*\@BoxTitle@Radius/7})[rounded corners=\@BoxTitle@Radius]--(title.south west)--(title.south east)--cycle;
\draw[#5,fill=#5!90,line width=2.0pt](title.north east)--([xshift={sqrt(15)*\@BoxTitle@Radius/7+\@BoxTitle@Radius}]title.north west)arc(asin(7/8):{270-asin(7/8)}:{8*\@BoxTitle@Radius/7})[rounded corners=\@BoxTitle@Radius]--(title.south west)--(title.south east)--cycle;
\else
\draw[white,fill=white,line width=10.0pt](title.north east)--([xshift={sqrt(15)*\@BoxTitle@Radius/7+\@BoxTitle@Radius}]title.north west)arc(asin(7/8):{360-asin(7/8)}:{8*\@BoxTitle@Radius/7})[rounded corners=\@BoxTitle@Radius]--(title.south east)--cycle;
\draw[#5,fill=#5!90,line width=2.0pt](title.north east)--([xshift={sqrt(15)*\@BoxTitle@Radius/7+\@BoxTitle@Radius}]title.north west)arc(asin(7/8):{360-asin(7/8)}:{8*\@BoxTitle@Radius/7})[rounded corners=\@BoxTitle@Radius]--(title.south east)--cycle;
\fi
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=white](P)at([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west){#6};
\endgroup},
#1}

%%编号定义盒子%%
\DeclareDocumentEnvironment{Definition}{ +O{} +O{} }{\begin{box3}[phantom={%
\if@mainmatter%
\refstepcounter{@definition}
\fi}]{\definitiontitle%
\if@mainmatter%
{\sffamily\environmentmark\the@prenumber.\the@definition}%
\fi}
[#1][#2][ColorA][\faCrosshairs]}{\end{box3}}
%%%%
\DeclareDocumentEnvironment{Theorem}{ +O{} +O{} }{\begin{box3}[phantom={%
\if@mainmatter%
\refstepcounter{@theorem}
\fi}]{\theoremtitle%
\if@mainmatter%
{\sffamily\environmentmark\the@prenumber.\the@theorem}%
\fi}
[#1][#2][ColorB][\faCrosshairs]}{\end{box3}}
%%%%
\DeclareDocumentEnvironment{Axiom}{ +O{} +O{} }{\begin{box3}[phantom={%
\if@mainmatter%
\refstepcounter{@axiom}
\fi}]{\axiomtitle%
\if@mainmatter%
{\sffamily\environmentmark\the@prenumber.\the@axiom}%
\fi}
[#1][#2][ColorI][\faCompactDisc]}{\end{box3}}
%%%%

%%不编号定义盒子%%
\DeclareDocumentEnvironment{Definition*}{ +O{} +O{} }{\begin{box3}{\definitiontitle}[#1][#2][ColorA][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Theorem*}{ +O{} +O{} }{\begin{box3}{\theoremtitle}[#1][#2][ColorB][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Axiom*}{ +O{} +O{} }{\begin{box3}{\axiomtitle}[#1][#2][ColorI][\faCompactDisc]}{\end{box3}}
%%%%

%%设置引理盒子%%
%盒子内脚注设置，使得脚注位于页面最下方而不是盒子最下方
\makesavenoteenv{box4}
%%
\DeclareTColorBox{box4}{+O{} +m +O{} +O{} O{ColorA} O{\faDiceD20}}{
ColorfulBox=#2/#3/#4/#5,
%%%%
underlay boxed title={%
\begingroup%
\BoxTitleFont%
\newdimen\@BoxTitle@Radius%
\@BoxTitle@Radius=\dimexpr\baselineskip/2\relax%0.85
\draw[white,fill=white,line width=10.0pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({8*\@BoxTitle@Radius/7});
\draw[white,fill=white,rounded corners=\@BoxTitle@Radius,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#5,fill=#5,rounded corners=\@BoxTitle@Radius,ultra thick](title.north west)rectangle(title.south east);
\draw[#5,fill=white,line width=2.75pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({8*\@BoxTitle@Radius/7});
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=#5](P)at([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west){#6};
\endgroup},
#1}

%%编号引理盒子%%
\DeclareDocumentEnvironment{Lemma}{ +O{} +O{}}{\begin{box4}[phantom={%
\if@mainmatter%
\refstepcounter{@lemma}
\fi}]{\lemmatitle%
\if@mainmatter%
{\sffamily\environmentmark\the@prenumber.\the@lemma}%
\fi}
[#1][#2][ColorE][\faGlobe]}{\end{box4}}
%%%%
\DeclareDocumentEnvironment{Corollary}{ +O{} +O{} }{\begin{box4}[phantom={%
\if@mainmatter%
\refstepcounter{@corollary}
\fi
}]{\corollarytitle%
\if@mainmatter%
{\sffamily\environmentmark\the@prenumber.\the@corollary}%
\fi}
[#1][#2][ColorG][\faCompactDisc]}{\end{box4}}
%%%%
\DeclareDocumentEnvironment{Proposition}{ +O{} +O{} }{\begin{box4}[phantom={%
\if@mainmatter%
\refstepcounter{@proposition}
\fi
}]{\propositiontitle%
\if@mainmatter%
{\sffamily\environmentmark\the@prenumber.\the@proposition}%
\fi}
[#1][#2][ColorH][\faGlobe]}{\end{box4}}
%%%%
%%不编号引理盒子%%
\DeclareDocumentEnvironment{Lemma*}{ +O{} +O{} }{\begin{box4}{\lemmatitle}[#1][#2][ColorE][\faGlobe]}{\end{box4}}
\DeclareDocumentEnvironment{Corollary*}{ +O{} +O{} }{\begin{box4}{\corollarytitle}[#1][#2][ColorG][\faCompactDisc]}{\end{box4}}
\DeclareDocumentEnvironment{Proposition*}{ +O{} +O{} }{\begin{box4}{\propositiontitle}[#1][#2][ColorH][\faGlobe]}{\end{box4}}
%%%%
%设置拓展盒子%%
%盒子内脚注设置，使得脚注位于页面最下方而不是盒子最下方
\makesavenoteenv{box5}
%%
\DeclareTColorBox{box5}{+O{} +m +O{} +O{} O{ColorA} O{\faLink}}{
ColorfulBox=#2/#3/#4/#5,
%%%%
underlay boxed title={%
\begingroup%
\BoxTitleFont%
\newdimen\@BoxTitle@Radius%
\@BoxTitle@Radius=\dimexpr\baselineskip/2\relax%0.85
\draw[white,fill=white,rounded corners=\@BoxTitle@Radius,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#5,fill=#5,rounded corners=\@BoxTitle@Radius,ultra thick](title.north west)rectangle(title.south east);
\fill[white,draw=white,line width=10.0pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({8*\@BoxTitle@Radius/7});
\fill[white,draw=#5,line width=2.75pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({8*\@BoxTitle@Radius/7});
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=#5] at([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west){#6};
\endgroup},
#1}

\DeclareDocumentEnvironment{Link}{ +O{} +O{} }{\begin{box5}{\linktitle}[#1][#2][ColorE][\faLink]}{\end{box5}}
\DeclareDocumentEnvironment{History}{ +O{} +O{} }{\begin{box5}{\historytitle}[#1][#2][ColorC][\faCalendar*]}
{\end{box5}}
\DeclareDocumentEnvironment{STS}{ +O{} +O{} }{\begin{box5}{\ststitle}[#1][#2][ColorH][\faCog]}
{\end{box5}}

%%设置案例盒子%%
%盒子内脚注设置，使得脚注位于页面最下方而不是盒子最下方
\makesavenoteenv{box6}
%%
\DeclareTColorBox{box6}{+O{} +m +O{} +O{} O{ColorA} O{\faFile*}}{%
ColorfulBox=#2/#3/#4/#5,
%%%%
underlay boxed title={%
\begingroup%
\BoxTitleFont%
\newdimen\@BoxTitle@Radius%
\@BoxTitle@Radius=\dimexpr\baselineskip/2\relax%0.85
\draw[white,fill=white,line width=10.0pt,rounded corners=\@BoxTitle@Radius](title.north east)rectangle(title.south west);
\draw[#5!90,fill=#5!90,line width=2.0pt,rounded corners=\@BoxTitle@Radius](title.north east)rectangle(title.south west);
%%%%
\path[fill=white]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({5*\@BoxTitle@Radius/3});
\draw[#5,fill=white,line width=2.75pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({8*\@BoxTitle@Radius/7});
%%%%
\pgfgetnodeheight(title)\@BoxTitle@Height
\ifdim\@BoxTitle@Height>2\@BoxTitle@Radius
\draw[#5,line width=2.0pt]
(title.north east)[sharp corners]--
([xshift={7*\@BoxTitle@Radius/3}]title.north west)arc(asin(3/5):{-asin(3/5)-90}:{5*\@BoxTitle@Radius/3})[rounded corners=\@BoxTitle@Radius]--
(title.south west)[rounded corners=\@BoxTitle@Radius]--
(title.south east)[rounded corners=\@BoxTitle@Radius]--cycle;
\else
%%%%
\draw[#5,line width=2.0pt]
(title.north east)[sharp corners]--
([xshift={7*\@BoxTitle@Radius/3}]title.north west)arc(asin(3/5):-asin(3/5):{5*\@BoxTitle@Radius/3})[rounded corners=\@BoxTitle@Radius]--
(title.south east)[rounded corners=\@BoxTitle@Radius]--cycle;
\fi
%%%%
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=#5](T)at([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west){#6};
\endgroup},
#1}

\DeclareDocumentEnvironment{Information}{ +O{} +O{} }{\begin{box6}{\informationtitle}[#1][#2][ColorI][\faFile*]}{\end{box6}}
\DeclareDocumentEnvironment{Application}{ +O{} +O{} }{\begin{box6}{\applicationtitle}[#1][#2][ColorA][\faTools]}{\end{box6}}
\DeclareDocumentEnvironment{Review}{ +O{} +O{} }{\begin{box6}{\reviewtitle}[#1][#2][ColorC][\faFan]}{\end{box6}}

%%设置色块盒子%%
%盒子内脚注设置，使得脚注位于页面最下方而不是盒子最下方
\makesavenoteenv{box7}
\makesavenoteenv{box7*}
%%
\DeclareTColorBox{box7}{ +O{} +O{} }{BlockBox=#2,#1}
\DeclareTColorBox{box7*}{ +O{} +O{} }{FoldBox=#2,#1}
%%
\newenvironment{Proof}{\begin{box7*}[][\faBars~~\prooftitle]}{\end{box7*}}
%%
\newenvironment{Solution}{\begin{box7*}[][\faBars~~\solutiontitle]}{\end{box7*}}
%%
\newcommand{\Summary}[1]{\begin{box7*}[before upper app=\vspace*{#1}][\faBars~~\summarytitle]\end{box7*}}
%%
\DeclareDocumentEnvironment{Block}{ +O{} }{%
\ifblank{#1}{\begin{box7}}{\begin{box7*}[][#1]}%
}{\ifblank{#1}{\end{box7}}{\end{box7*}}%
}

%%设置英文与代码盒子%%
%盒子内脚注设置，使得脚注位于页面最下方而不是盒子最下方
\makesavenoteenv{box8}

\DeclareTColorBox{box8}{+O{} +m +O{} +O{} O{ColorA} O{}}{CodeBox=#2/#3/#4/#5/#6,#1}

\NewDocumentEnvironment{Comprehension}{+O{} +O{} }{\begin{box8}[phantom={%
\if@mainmatter%
\refstepcounter{@comprehension}%
\fi}]{\comprehensiontitle%
\if@mainmatter%
{\sffamily\the@comprehension}%
\fi}[#1][#2][ColorB]}{\end{box8}}
%%
\NewDocumentEnvironment{Cloze}{+O{} +O{} }{\begin{box8}[phantom={%
\if@mainmatter%
\refstepcounter{@cloze}%
\fi}]{\clozetitle%
\if@mainmatter%
{\sffamily\the@cloze}%
\fi}[#1][#2][ColorA]}{\end{box8}}
%%
\NewDocumentEnvironment{Article}{+O{} +O{} }{\begin{box8}{\articletitle}[#1][#2][ColorC]}{\end{box8}}
%%
\NewDocumentEnvironment{Vocabulary}{ +O{} +O{} }{\begin{box8}{\vocabularytitle}[#1][#2][ColorE]}{\end{box8}}

\NewDocumentEnvironment{Comprehension*}{+O{} +O{} }{\begin{box8}{\comprehensiontitle}[#1][#2][ColorB]}{\end{box8}}
%%
\NewDocumentEnvironment{Cloze*}{+O{} +O{} }{\begin{box8}{\clozetitle}[#1][#2][ColorA]}{\end{box8}}

%%%%
\ifTextBook@mintedcode
%%使用minted生成代码块%%
\newtcblisting{PythonBox}[1][]{
CodeBox={\codetitle}/#1/{}/ColorA/{\uppercase{\sffamily python}},
minted options={breaklines,autogobble,linenos,numbersep=7.5mm,stepnumber=5},
listing only,listing engine=minted,
minted language=python}
%%
\newtcblisting{CppBox}[1][]{
CodeBox={\codetitle}/#1/{}/ColorB/{\uppercase{\sffamily cpp}},
minted options={breaklines,autogobble,linenos,numbersep=7.5mm,stepnumber=5},
listing only,listing engine=minted,
minted language=cpp}
%%
\newtcblisting{JavaBox}[1][]{
CodeBox={\codetitle}/#1/{}/ColorC/{\uppercase{\sffamily java}},
minted options={breaklines,autogobble,linenos,numbersep=7.5mm,stepnumber=5},
listing only,listing engine=minted,
minted language=java}
%%
\NewTCBListing{OtherCodeBox}{O{} m O{ColorA}}{
CodeBox={\codetitle}/#1/{}/#3/{\uppercase{\sffamily#2}},
minted options={breaklines,autogobble,linenos,numbersep=7.5mm,stepnumber=5},
listing only,listing engine=minted,
minted language=#2}
\else
%%使用listing生成代码块%%
%参数#1为标题，是可选参数，#2为代码关键词等选项，是必选参数
\NewTCBListing{PythonBox}{O{} m}{
CodeBox={\codetitle}/#1/{}/ColorA/{\uppercase{\sffamily python}},
listing only,listing engine=listings,
listing options={language=Python,columns=fullflexible,
basicstyle=\ttfamily,
keywordstyle=\bfseries\color{NavyBlue},
emphstyle=\bfseries\color{Rhodamine},
commentstyle=\rmfamily\itshape\color{black!50!white},
stringstyle=\bfseries\color{PineGreen!90!black},
numberstyle=\linenumberfont,
showstringspaces=false,showtabs=false,tabsize=2,
breaklines=true,numberfirstline=true,firstnumber=1,stepnumber=5,numbers=left,numbersep=7.5mm,
#2}}
%%
\NewTCBListing{CppBox}{O{} m}{
CodeBox={\codetitle}/#1/{}/ColorB/{\uppercase{\sffamily cpp}},
listing only,listing engine=listings,
listing options={language=C++,columns=fullflexible,
basicstyle=\ttfamily,
keywordstyle=\bfseries\color{NavyBlue},
emphstyle=\bfseries\color{Rhodamine},
commentstyle=\rmfamily\itshape\color{black!50!white},
stringstyle=\bfseries\color{PineGreen!90!black},
numberstyle=\linenumberfont,
showstringspaces=false,showtabs=false,tabsize=2,
breaklines=true,numberfirstline=true,firstnumber=1,stepnumber=5,numbers=left,numbersep=7.5mm,
#2}}
%%
\NewTCBListing{JavaBox}{O{} m}{
CodeBox={\codetitle}/#1/{}/ColorC/{\uppercase{\sffamily java}},
listing only,listing engine=listings,
listing options={language=Java,columns=fullflexible,
basicstyle=\ttfamily,
keywordstyle=\bfseries\color{NavyBlue},
emphstyle=\bfseries\color{Rhodamine},
commentstyle=\rmfamily\itshape\color{black!50!white},
stringstyle=\bfseries\color{PineGreen!90!black},
numberstyle=\linenumberfont,
showstringspaces=false,showtabs=false,tabsize=2,
breaklines=true,numberfirstline=true,firstnumber=1,stepnumber=5,numbers=left,numbersep=7.5mm,
#2}}
%%
\NewTCBListing{OtherCodeBox}{O{} m m O{ColorA}}{
CodeBox={\codetitle}/#1/{}/#4/{\uppercase{\sffamily#2}},
listing only,listing engine=listings,
listing options={language=#2,columns=fullflexible,
basicstyle=\ttfamily,
keywordstyle=\bfseries\color{NavyBlue},
emphstyle=\bfseries\color{Rhodamine},
commentstyle=\rmfamily\itshape\color{black!50!white},
stringstyle=\bfseries\color{PineGreen!90!black},
numberstyle=\linenumberfont,
showstringspaces=false,showtabs=false,tabsize=2,
breaklines=true,numberfirstline=true,firstnumber=1,stepnumber=5,numbers=left,numbersep=7.5mm,
#3}}
\fi

%%%%
%设置注释盒子%%
%盒子内脚注设置，使得脚注位于页面最下方而不是盒子最下方
\makesavenoteenv{box9}
%%
\DeclareTColorBox{box9}{ +O{} +m O{ColorA} }{%
NoteBox=#2/#3,
breakable,%非边注盒子需要此参数
fontupper=\MainFont\kaiti\itshape,
fontlower=\MainFont\kaiti\itshape,
#1}
%%%%
\makesavenoteenv{box10}
%%
\DeclareTColorBox{box10}{ +O{} +m m }{%
NoteBox=#2/#3,%边注内盒子不要加载breakable参数，会导致行距异常！
fontupper=\MarginNoteFont,
fontlower=\MarginNoteFont,
#1}
%%边注标记盒子
\newtcbox{\sidenotemark}[1][ColorA]{on line,empty,colupper=white,fontupper=\FontSizeSet{11pt}\bfseries,
boxsep=0mm,left=2.0mm,right=2.0mm,top=0.5mm,bottom=0.5mm,
overlay={%
\pgfgetnodeheight(frame)\@sidebox@height%
\draw[#1,fill=#1,rounded corners={\@sidebox@height/2}](frame.north west)rectangle(frame.south east);
}}
%%边注盒子%%
%%+m表示允许换行、空行的参数%%
\DeclareDocumentCommand{\RelaInfo}{ s +m O{0pt} }
{\if@mainmatter%
\refstepcounter{@sideinfo}%
\fi%
\IfBooleanTF{#1}
{\hspace{0.5em}\sidenotemark[ColorH]{\relainfotitle~{\sffamily\the@sideinfo}}%
\marginnote{%
\parindent=0pt%
\begin{box10}{\faCommentDots~~\relainfotitle~{\sffamily\the@sideinfo}}{ColorH}
#2
\end{box10}}[#3]
}{\begin{box9}{\faCommentDots~~\relainfotitle~{\sffamily\the@sideinfo}}[ColorH]
#2
\end{box9}
\gobble{#3}}
}
%%%%
\DeclareDocumentCommand{\DeepThink}{ s +m O{0pt} }
{\if@mainmatter%
\refstepcounter{@sidethink}%
\fi%
\IfBooleanTF{#1}
{\hspace{0.5em}\sidenotemark[ColorB!90!black]{\deepthinktitle~{\sffamily\the@sidethink}}%
\marginnote{%
\parindent=0pt%
\begin{box10}{\faTh~~\deepthinktitle~{\sffamily\the@sidethink}}{ColorB!90!black}
#2
\end{box10}}[#3]
}{\begin{box9}{\faTh~~\deepthinktitle~{\sffamily\the@sidethink}}[ColorB!90!black]
#2
\end{box9}
\gobble{#3}}
}
%%%%
\DeclareDocumentCommand{\Remark}{ s +m O{0pt} }
{\if@mainmatter%
\refstepcounter{@sidemark}%
\fi%
\IfBooleanTF{#1}
{\hspace{0.5em}\sidenotemark[ColorF]{\remarktitle~{\sffamily\the@sidemark}}%
\marginnote{%
\parindent=0pt%
\begin{box10}{\faBurn~~\remarktitle~{\sffamily\the@sidemark}}{ColorF}
#2
\end{box10}}[#3]
}{\begin{box9}{\faBurn~~\remarktitle~{\sffamily\the@sidemark}}[ColorF]
#2
\end{box9}
\gobble{#3}}
}

%%数学公式小盒子%%
\newtcbox{\Formula}[1][]{%
nobeforeafter,math upper,tcbox raise base,
width=\linewidth,tcbox width=auto limited,
enhanced standard,
before={\begin{center}},after={\end{center}},
colframe=ColorB!7.5,colback=ColorB!7.5,
rounded corners,arc=5.0pt,colupper=ColorA,#1}

%%三叶草图案%%
\NewDocumentCommand{\Clover}{O{ColorB!7.5} O{0.25}}{%
\tikz[#1,scale=#2]{%
\fill(.1,0) ..controls + (-60:2) and + (60:4)..(-3,-25)--++(-.5,0) ..controls + (60:2) and + (-60:2)..(-.1,0)--cycle;
\def\petal{%
(0.2,0) ..controls + (90:2) and + (-90:4)..(6,7) ..controls + (90:4) and + (90:4)..(0,7) ..controls + (90:4) and + (90:4)..(-6,7) ..controls + (-90:4) and + (90:2)..(-.2,0)}
\fill\petal;
\fill[rotate=120]\petal;
\fill[rotate=-120]\petal;}
}
%%扉页样式%%
\newcommand{\@Title@PageStyle}{%
\begin{tikzpicture}[remember picture,overlay]%
\newdimen\@GutterWidth
%%
\@GutterWidth=\dimexpr\@FrameWidth+\@innerlen-\@outerlen\relax
%%根据页数的奇偶生成%%
\ifodd\value{page}
\coordinate(A)at([xshift=-\@ExtraWidth,yshift=\@ExtraWidth]current page.north west);
\coordinate(B)at([xshift=\@ExtraWidth,yshift=\@ExtraWidth]current page.north east);
\coordinate(C)at([xshift=\@ExtraWidth,yshift=-\@ExtraWidth]current page.south east);
\coordinate(D)at([xshift=-\@ExtraWidth,yshift=-\@ExtraWidth]current page.south west);
\coordinate(E)at([xshift=\@GutterWidth,yshift=\@FrameWidth]D);
\coordinate(F)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(G)at([xshift=-\@FrameWidth,yshift=-\@FrameWidth]B);
\coordinate(H)at([xshift=\@GutterWidth,yshift=-\@FrameWidth]A);
\else%
\coordinate(A)at([xshift=\@ExtraWidth,yshift=\@ExtraWidth]current page.north east);
\coordinate(B)at([xshift=-\@ExtraWidth,yshift=\@ExtraWidth]current page.north west);
\coordinate(C)at([xshift=-\@ExtraWidth,yshift=-\@ExtraWidth]current page.south west);
\coordinate(D)at([xshift=\@ExtraWidth,yshift=-\@ExtraWidth]current page.south east);
\coordinate(E)at([xshift=-\@GutterWidth,yshift=\@FrameWidth]D);
\coordinate(F)at([xshift=\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(G)at([xshift=\@FrameWidth,yshift=-\@FrameWidth]B);
\coordinate(H)at([xshift=-\@GutterWidth,yshift=-\@FrameWidth]A);
\fi%
%%背景%%
\path[fill=ColorB!7.5,sharp corners](D)rectangle(B);
%%
\path[fill=ColorB!15]
(A)--(B)--(C)--(D)--cycle
(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)[sharp corners]--cycle;
%%
\node[inner sep=0mm]at(current page.center){\Clover[ColorB!15][0.25]};
\end{tikzpicture}}
%%重定义标题页%%
\RenewDocumentCommand{\maketitle}{}{%
\begin{titlepage}%
\setlength{\parindent}{0em}%务必放在第一行
\@Title@PageStyle%
\centering\color{ColorA}%
%%书籍系列%%
{\TitlepageNormalFont%
\ifdefvoid{\@serieslogo}{}{\raisebox{-0.2cm}{\mbox{\includegraphics[width=0.75cm]{\@serieslogo}\hskip0.25cm}}}\ifdefvoid{\@seriesname}{\\}{\@seriesname\\}%
}%
\vskip1.0cm%
%%标题%%
{\TitlepageTitleFont\@title\\}%
%%英文标题%%
\ifdefvoid{\@englishtitle}{}{%
\vskip0.5cm%
{\TitlepageEnglishFont\@englishtitle\\}}
%%副标题%%
\ifdefvoid{\@subtitle}{}{%
\vskip0.75cm%
{\TitlepageSubtitleFont\@subtitle\\}}%
%%英文副标题%%
\ifdefvoid{\@englishsubtitle}{}{%
\vskip0.25cm%
{\TitlepageEnglishFont\@englishsubtitle\\}}%
%%版本号%%
\ifdefvoid{\@version}{}{%
\vskip0.75cm%
{\TitlepageNormalFont 第\@version 版\\}}%
\vskip1.0cm%
%%作者%%
{\TitlepageNormalFont%
\begin{varwidth}{\linewidth-4.0cm}
\@author
\end{varwidth}%
\qquad%
\begin{varwidth}{2.0cm}
编著
\end{varwidth}%
\\}%
\vfill%
%%出版社%%
{\TitlepageNormalFont%
\ifdefvoid{\@presslogo}{}{\raisebox{-0.2cm}{\mbox{\includegraphics[width=0.75cm]{\@presslogo}\hskip0.25cm}}}\ifdefvoid{\@pressname}{}{\@pressname}%
}%
\clearpage%
\setlength{\parindent}{2.0em}%
\@Title@PageStyle%
\RaggedRight%
\@bookintro%
\end{titlepage}}
\makeatother
