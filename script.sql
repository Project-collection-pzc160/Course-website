USE [CourseManagement]
GO
/****** Object:  Table [dbo].[bcourses]    Script Date: 2020/7/24 15:13:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bcourses](
	[id] [nvarchar](32) NOT NULL,
	[cname] [nvarchar](32) NOT NULL,
	[credit] [numeric](2, 1) NOT NULL,
	[tname] [nvarchar](32) NOT NULL,
	[academy] [nvarchar](32) NOT NULL,
	[major] [nvarchar](32) NULL,
	[grade] [int] NULL,
	[schoolyear] [nvarchar](32) NOT NULL,
	[schoolterm] [int] NOT NULL,
	[type] [nvarchar](32) NOT NULL,
	[remain/max] [nvarchar](32) NULL,
	[timeandplace] [nvarchar](32) NULL,
	[remark] [nvarchar](32) NULL,
	[school] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uc]    Script Date: 2020/7/24 15:13:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uc](
	[account] [nvarchar](32) NOT NULL,
	[courseid] [nvarchar](32) NOT NULL,
	[state] [nvarchar](32) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 2020/7/24 15:13:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[account] [nvarchar](32) NOT NULL,
	[password] [nvarchar](32) NOT NULL,
	[email] [nvarchar](32) NOT NULL,
	[ulevel] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[application]    Script Date: 2020/7/24 15:13:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[application]
AS
SELECT   dbo.uc.account, dbo.uc.state, dbo.bcourses.id, dbo.bcourses.cname, dbo.bcourses.credit, dbo.bcourses.tname, 
                dbo.bcourses.academy, dbo.bcourses.major, dbo.bcourses.schoolyear, dbo.bcourses.schoolterm, dbo.bcourses.type, 
                dbo.bcourses.timeandplace, dbo.bcourses.remark, dbo.bcourses.school
FROM      dbo.uc INNER JOIN
                dbo.bcourses ON dbo.uc.courseid = dbo.bcourses.id
WHERE   (dbo.uc.state = '待审核')

GO
/****** Object:  View [dbo].[application2]    Script Date: 2020/7/24 15:13:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[application2]
AS
SELECT   dbo.uc.account, dbo.uc.state, dbo.bcourses.id, dbo.bcourses.cname, dbo.bcourses.credit, dbo.bcourses.tname, 
                dbo.bcourses.academy, dbo.bcourses.major, dbo.bcourses.schoolyear, dbo.bcourses.schoolterm, dbo.bcourses.type, 
                dbo.bcourses.timeandplace, dbo.bcourses.remark, dbo.bcourses.school
FROM      dbo.uc INNER JOIN
                dbo.bcourses ON dbo.uc.courseid = dbo.bcourses.id

GO
/****** Object:  View [dbo].[gcourses]    Script Date: 2020/7/24 15:13:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[gcourses]
AS
SELECT   id, cname, credit, tname, type, [remain/max], timeandplace, remark, academy, school
FROM      dbo.bcourses
WHERE   (type = '通识课')

GO
/****** Object:  View [dbo].[pcourses]    Script Date: 2020/7/24 15:13:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[pcourses]
AS
SELECT   id, cname, credit, tname, academy, major, grade, type, [remain/max], timeandplace, remark, school
FROM      dbo.bcourses
WHERE   (type = '专业课')

GO
/****** Object:  View [dbo].[ucourses]    Script Date: 2020/7/24 15:13:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ucourses]
AS
SELECT   dbo.uc.account, dbo.bcourses.id, dbo.bcourses.cname, dbo.bcourses.credit, dbo.bcourses.tname, 
                dbo.bcourses.academy, dbo.bcourses.major, dbo.bcourses.schoolyear, dbo.bcourses.schoolterm, 
                dbo.bcourses.timeandplace, dbo.bcourses.remark, dbo.bcourses.type, dbo.bcourses.school, dbo.uc.state
FROM      dbo.bcourses INNER JOIN
                dbo.uc ON dbo.bcourses.id = dbo.uc.courseid
WHERE   (dbo.uc.state = '成功')

GO
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200001', N'创业管理', CAST(2.0 AS Numeric(2, 1)), N'秦仪', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200002', N'数学精神与方法', CAST(2.0 AS Numeric(2, 1)), N'杜乃林', N'公共数学教学', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200003', N'中国司法制度', CAST(2.0 AS Numeric(2, 1)), N'叶欣', N'国际教育学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200004', N'诺贝尔奖物理实验', CAST(2.0 AS Numeric(2, 1)), N'刘海林', N'物理科学与技术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200005', N'科技与考古', CAST(2.0 AS Numeric(2, 1)), N'潘春旭', N'物理科学与技术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200006', N'建筑装饰漫谈', CAST(2.0 AS Numeric(2, 1)), N'吴定燕', N'水利水电学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200007', N'黄河史', CAST(2.0 AS Numeric(2, 1)), N'梁利', N'水利水电学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200008', N'建筑材料与人居环境', CAST(2.0 AS Numeric(2, 1)), N'阮燕', N'水利水电学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200009', N'中国水利史', CAST(2.0 AS Numeric(2, 1)), N'王红', N'水利水电学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200010', N'地铁与城市文明', CAST(2.0 AS Numeric(2, 1)), N'苏凯', N'水利水电学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200011', N'环境水利学', CAST(2.0 AS Numeric(2, 1)), N'林忠兵', N'水利水电学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200012', N'水利现代化', CAST(2.0 AS Numeric(2, 1)), N'洪林', N'水利水电学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200013', N'人口资源环境与可持续发展', CAST(2.0 AS Numeric(2, 1)), N'王旭', N'资源与环境科学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200014', N'“一国两制”与国家统一概论', CAST(2.0 AS Numeric(2, 1)), N'段磊', N'法学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200015', N'哲学核心问题', CAST(2.0 AS Numeric(2, 1)), N'潘磊', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200016', N'古希腊文明', CAST(2.0 AS Numeric(2, 1)), N'赵林', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200017', N'知心的艺术', CAST(2.0 AS Numeric(2, 1)), N'赵俊华', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200018', N'伦理学', CAST(2.0 AS Numeric(2, 1)), N'李勇', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200019', N'毕生发展心理学', CAST(2.0 AS Numeric(2, 1)), N'张春妹', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200020', N'国际关系视角下的国际法', CAST(2.0 AS Numeric(2, 1)), N'周晓明', N'政治与公共管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200021', N'新时代中国特色大国外交与国际关系', CAST(2.0 AS Numeric(2, 1)), N'赵嵘', N'政治与公共管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200022', N'税收与我们的生活', CAST(2.0 AS Numeric(2, 1)), N'王玮', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200023', N'世界经济史', CAST(2.0 AS Numeric(2, 1)), N'刁莉', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200024', N'广告设计创新思维与制作', CAST(2.0 AS Numeric(2, 1)), N'刘艺琴', N'新闻与传播学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200025', N'数字商务与创业', CAST(2.0 AS Numeric(2, 1)), N'张李义', N'信息管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200026', N'现代管理学', CAST(2.0 AS Numeric(2, 1)), N'胡吉明', N'信息管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200027', N'创业论坛', CAST(2.0 AS Numeric(2, 1)), N'张敏', N'信息管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200028', N'互联网创意思维与用户体验', CAST(2.0 AS Numeric(2, 1)), N'赵杨', N'信息管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200029', N'企业竞争情报', CAST(2.0 AS Numeric(2, 1)), N'查先进', N'信息管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200030', N'中国禅宗思想史', CAST(2.0 AS Numeric(2, 1)), N'姚彬彬', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200031', N'辩论实践与鉴赏', CAST(2.0 AS Numeric(2, 1)), N'周玄毅', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200032', N'逻辑与思维导论', CAST(2.0 AS Numeric(2, 1)), N'费定舟', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200033', N'宗教学概论', CAST(2.0 AS Numeric(2, 1)), N'翟志宏', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200034', N'大数据背景下的营销思维', CAST(2.0 AS Numeric(2, 1)), N'朱华伟', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200035', N'创新思维与方法', CAST(2.0 AS Numeric(2, 1)), N'杜莉', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200036', N'口腔保健', CAST(1.0 AS Numeric(2, 1)), N'台保军', N'口腔医学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200037', N'创新思维与方法', CAST(2.0 AS Numeric(2, 1)), N'谢皓', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200038', N'心理学与生活', CAST(2.0 AS Numeric(2, 1)), N'刘毅', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200039', N'心理学与生活', CAST(2.0 AS Numeric(2, 1)), N'李杰', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200040', N'人格心理学', CAST(2.0 AS Numeric(2, 1)), N'刘毅', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200041', N'婚姻家庭法基本制度与热点问题研究', CAST(2.0 AS Numeric(2, 1)), N'李国庆', N'法学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200042', N'生活中的经济法', CAST(2.0 AS Numeric(2, 1)), N'周围', N'法学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200043', N'“一国两制”与国家统一概论', CAST(2.0 AS Numeric(2, 1)), N'段磊', N'法学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200044', N'西方城市空间与社会文化', CAST(2.0 AS Numeric(2, 1)), N'胡嘉渝', N'城市设计学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200045', N'现代住区与城市社会', CAST(2.0 AS Numeric(2, 1)), N'杨丽', N'城市设计学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200046', N'民间技艺的传承与创新', CAST(2.0 AS Numeric(2, 1)), N'黄敏', N'城市设计学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200047', N'Inventor产品设计及新标准', CAST(2.0 AS Numeric(2, 1)), N'冯霞', N'城市设计学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200048', N'台湾文学与文化', CAST(2.0 AS Numeric(2, 1)), N'严靖', N'文学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200049', N'诺贝尔文学奖作品导读', CAST(2.0 AS Numeric(2, 1)), N'赵小琪', N'文学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200050', N'世界华文文学经典欣赏', CAST(2.0 AS Numeric(2, 1)), N'赵小琪', N'文学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200051', N'《圣经》选读', CAST(2.0 AS Numeric(2, 1)), N'陈?', N'大学英语部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200052', N'食品安全', CAST(2.0 AS Numeric(2, 1)), N'曾晓波', N'药学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200053', N'生物恐怖与生物安全', CAST(2.0 AS Numeric(2, 1)), N'艾时斌', N'药学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200054', N'计算机基础', CAST(2.0 AS Numeric(2, 1)), N'熊素萍', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200055', N'计算机基础', CAST(2.0 AS Numeric(2, 1)), N'黄文斌', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200056', N'计算机基础', CAST(2.0 AS Numeric(2, 1)), N'何扬帆', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200057', N'计算机基础', CAST(2.0 AS Numeric(2, 1)), N'刘?', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200058', N'计算机基础', CAST(2.0 AS Numeric(2, 1)), N'罗云芳', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200059', N'计算机基础', CAST(2.0 AS Numeric(2, 1)), N'杨先娣', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200060', N'计算机基础', CAST(2.0 AS Numeric(2, 1)), N'郭玮', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200061', N'计算机基础', CAST(2.0 AS Numeric(2, 1)), N'李晖', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200062', N'计算机基础', CAST(2.0 AS Numeric(2, 1)), N'周雅洁', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200063', N'多媒体技术与虚拟现实', CAST(2.0 AS Numeric(2, 1)), N'刘英', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200064', N'多媒体技术与虚拟现实', CAST(2.0 AS Numeric(2, 1)), N'宋麟', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200065', N'多媒体技术与虚拟现实', CAST(2.0 AS Numeric(2, 1)), N'李艳', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200066', N'人工智能进展', CAST(2.0 AS Numeric(2, 1)), N'张曙光', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200067', N'人工智能进展', CAST(2.0 AS Numeric(2, 1)), N'宋麟', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200068', N'英国历史文化要览', CAST(2.0 AS Numeric(2, 1)), N'张影', N'大学英语部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200069', N'识读美国', CAST(2.0 AS Numeric(2, 1)), N'祝捷', N'大学英语部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200070', N'中西民俗文化对比赏析', CAST(2.0 AS Numeric(2, 1)), N'邓长慧', N'大学英语部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200071', N'中西民俗文化对比赏析', CAST(2.0 AS Numeric(2, 1)), N'刘莹', N'大学英语部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200072', N'当代经济问题', CAST(2.0 AS Numeric(2, 1)), N'李芳(大)', N'大学英语部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200073', N'国外新闻业与新闻英语导读', CAST(2.0 AS Numeric(2, 1)), N'张青', N'大学英语部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200074', N'遥感技术应用及发展', CAST(1.0 AS Numeric(2, 1)), N'龚?', N'遥感信息工程学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200075', N'美的历程', CAST(2.0 AS Numeric(2, 1)), N'周祝红', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200076', N'生物恐怖与生物安全', CAST(2.0 AS Numeric(2, 1)), N'艾时斌', N'药学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200077', N'西方美术鉴赏', CAST(2.0 AS Numeric(2, 1)), N'阮晴', N'资源与环境科学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200078', N'人文社科文献检索与数字化分析', CAST(2.0 AS Numeric(2, 1)), N'涂文波', N'图书馆', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200079', N'信息素养与实践', CAST(2.0 AS Numeric(2, 1)), N'龚芙蓉', N'图书馆', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200080', N'数据素养与数据利用', CAST(2.0 AS Numeric(2, 1)), N'刘霞', N'图书馆', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200081', N'生物安全概论', CAST(2.0 AS Numeric(2, 1)), N'汤宏斌', N'其它', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200082', N'当代国际经济热点问题', CAST(2.0 AS Numeric(2, 1)), N'胡艺', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200083', N'消费者心理与营销策略', CAST(2.0 AS Numeric(2, 1)), N'崔楠', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200084', N'《左传》导读', CAST(2.0 AS Numeric(2, 1)), N'鲁家亮', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200085', N'古典音乐大师', CAST(2.0 AS Numeric(2, 1)), N'江柏安', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200086', N'舞台表演艺术审美体验', CAST(2.0 AS Numeric(2, 1)), N'刘丹丽', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200087', N'莎士比亚与西方社会', CAST(2.0 AS Numeric(2, 1)), N'戴丹妮', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200088', N'莎士比亚戏剧导读', CAST(2.0 AS Numeric(2, 1)), N'戴丹妮', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200089', N'英语诗歌欣赏', CAST(2.0 AS Numeric(2, 1)), N'王爱菊', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200090', N'美国社会与文化', CAST(2.0 AS Numeric(2, 1)), N'熊伟', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200091', N'世界英语概览', CAST(2.0 AS Numeric(2, 1)), N'张妍岩', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200092', N'华裔英语文学经典赏析', CAST(2.0 AS Numeric(2, 1)), N'黄忠', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200093', N'诺贝尔奖物理实验', CAST(2.0 AS Numeric(2, 1)), N'刘海林', N'物理科学与技术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200094', N'逻辑学导论', CAST(2.0 AS Numeric(2, 1)), N'杜珊珊', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200095', N'基督教与二十世纪中国文学', CAST(2.0 AS Numeric(2, 1)), N'荣光启', N'文学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200096', N'贝多芬经典作品赏析', CAST(2.0 AS Numeric(2, 1)), N'胡壮利', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200097', N'西方音乐史与名作赏析', CAST(2.0 AS Numeric(2, 1)), N'陈雯', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200098', N'艺术鉴赏与批评导引', CAST(2.0 AS Numeric(2, 1)), N'王杰红', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200099', N'音乐欣赏', CAST(2.0 AS Numeric(2, 1)), N'江柏安', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200100', N'音乐欣赏', CAST(2.0 AS Numeric(2, 1)), N'李格', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
GO
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200101', N'中华乐教导引', CAST(2.0 AS Numeric(2, 1)), N'易栋', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200102', N'电影导演大师创意解读', CAST(2.0 AS Numeric(2, 1)), N'彭万荣', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200103', N'音乐剧鉴赏', CAST(2.0 AS Numeric(2, 1)), N'吴靓', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200104', N'校园戏剧创意与实践', CAST(2.0 AS Numeric(2, 1)), N'杨诚', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200105', N'太极文化与健康', CAST(2.0 AS Numeric(2, 1)), N'蔺志华', N'体育部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200106', N'体育旅游', CAST(2.0 AS Numeric(2, 1)), N'张力', N'体育部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200107', N'户外运动与博物教育', CAST(2.0 AS Numeric(2, 1)), N'许少峰', N'体育部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200108', N'民族传统体育文化赏析', CAST(2.0 AS Numeric(2, 1)), N'刘欣刚', N'体育部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200109', N'现代生活环境与都市病', CAST(2.0 AS Numeric(2, 1)), N'王洪新', N'电气与自动化学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200110', N'心理学与生活', CAST(2.0 AS Numeric(2, 1)), N'李杰', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200111', N'中外名城赏析', CAST(2.0 AS Numeric(2, 1)), N'陈婷婷', N'城市设计学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200112', N'日本文化漫谈', CAST(2.0 AS Numeric(2, 1)), N'曾丹', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200113', N'电影中的俄罗斯文学', CAST(2.0 AS Numeric(2, 1)), N'王艳卿', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200114', N'莎士比亚戏剧导读', CAST(2.0 AS Numeric(2, 1)), N'戴丹妮', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200115', N'美国社会与文化', CAST(2.0 AS Numeric(2, 1)), N'熊伟', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200116', N'世界英语概览', CAST(2.0 AS Numeric(2, 1)), N'张妍岩', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200117', N'电影中的俄罗斯文学', CAST(2.0 AS Numeric(2, 1)), N'王艳卿', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200118', N'急救常识', CAST(2.0 AS Numeric(2, 1)), N'赵剡', N'第二临床学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200119', N'计算机基础', CAST(2.0 AS Numeric(2, 1)), N'黄文斌', N'计算中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200120', N'音乐欣赏', CAST(2.0 AS Numeric(2, 1)), N'李格', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200121', N'校园戏剧创意与实践', CAST(2.0 AS Numeric(2, 1)), N'杨诚', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200122', N'中国文学简史', CAST(2.0 AS Numeric(2, 1)), N'胡春润', N'文学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200123', N'中国书法基础', CAST(2.0 AS Numeric(2, 1)), N'萧圣中', N'文学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200124', N'鲁迅名篇赏析', CAST(1.0 AS Numeric(2, 1)), N'余蔷薇', N'文学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200125', N'文学与人生', CAST(2.0 AS Numeric(2, 1)), N'汪树东', N'文学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200126', N'基础西班牙语（1）', CAST(3.0 AS Numeric(2, 1)), N'牛田禾', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200127', N'日本文化漫谈', CAST(2.0 AS Numeric(2, 1)), N'曾丹', N'外国语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200128', N'当代世界经济与政治', CAST(2.0 AS Numeric(2, 1)), N'封永平', N'政治与公共管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200129', N'数学模型', CAST(2.0 AS Numeric(2, 1)), N'胡元明', N'公共数学教学', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200130', N'化学与社会', CAST(2.0 AS Numeric(2, 1)), N'蔡苹', N'化学与分子科学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200131', N'人文化学', CAST(2.0 AS Numeric(2, 1)), N'胡继明', N'化学与分子科学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200132', N'化学世界', CAST(2.0 AS Numeric(2, 1)), N'高志农', N'化学与分子科学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200133', N'诺贝尔奖史话', CAST(2.0 AS Numeric(2, 1)), N'周平', N'化学与分子科学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200134', N'量子世界探秘', CAST(2.0 AS Numeric(2, 1)), N'王宝山', N'化学与分子科学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200135', N'化学的今天与明天', CAST(2.0 AS Numeric(2, 1)), N'李仁杰', N'化学与分子科学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200136', N'分子水平看世界', CAST(2.0 AS Numeric(2, 1)), N'高志农', N'化学与分子科学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200137', N'化学与社会', CAST(2.0 AS Numeric(2, 1)), N'罗威', N'化学与分子科学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200138', N'人口资源环境与可持续发展', CAST(2.0 AS Numeric(2, 1)), N'王旭', N'资源与环境科学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200139', N'青铜器鉴赏??从希腊罗马到古代中国', CAST(2.0 AS Numeric(2, 1)), N'张昌平', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200140', N'考古与人类文明进程', CAST(2.0 AS Numeric(2, 1)), N'余西云', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200141', N'世界军事史', CAST(2.0 AS Numeric(2, 1)), N'张士伟', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200142', N'《史记》导读', CAST(2.0 AS Numeric(2, 1)), N'薛梦潇', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200143', N'国际组织专题', CAST(2.0 AS Numeric(2, 1)), N'刘晓莉', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200144', N'唐代碑石与文化', CAST(2.0 AS Numeric(2, 1)), N'黄楼', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200145', N'明清小说中的历史文化', CAST(2.0 AS Numeric(2, 1)), N'焦?', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200146', N'中国传统礼仪与风俗', CAST(2.0 AS Numeric(2, 1)), N'吴兆丰', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200147', N'世界文明史', CAST(2.0 AS Numeric(2, 1)), N'潘迎春', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200148', N'简明世界史（一）', CAST(2.0 AS Numeric(2, 1)), N'潘迎春', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200149', N'中华文明史', CAST(2.0 AS Numeric(2, 1)), N'魏斌', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200150', N'简明中国史', CAST(2.0 AS Numeric(2, 1)), N'魏斌', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200151', N'专业课程设计(汉语)', CAST(3.0 AS Numeric(2, 1)), N'杨娜', N'汽车工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200152', N'智能车辆平台设计开发(汉语)', CAST(4.0 AS Numeric(2, 1)), N'李卫华', N'汽车工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200153', N'交通工程CAD设计(汉语)', CAST(1.5 AS Numeric(2, 1)), N'孙梦琦', N'汽车工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200154', N'工科讲座(汉语)', CAST(1.0 AS Numeric(2, 1)), N'马国胜', N'汽车工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200155', N'专业课程设计(汉语)', CAST(3.0 AS Numeric(2, 1)), N'林波', N'汽车工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200156', N'交通规划软件应用(汉语)', CAST(2.0 AS Numeric(2, 1)), N'侯芹忠', N'汽车工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200157', N'交通规划实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'冷军强', N'汽车工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200158', N'基础工程课程设计（建筑）(汉语)', CAST(1.0 AS Numeric(2, 1)), N'赵庆丽', N'土木工程系', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200159', N'基础工程课程设计(汉语)', CAST(1.0 AS Numeric(2, 1)), N'赵庆丽', N'土木工程系', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200160', N'混凝土与砌体结构课程设计(汉语)', CAST(1.5 AS Numeric(2, 1)), N'唐海红', N'土木工程系', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200161', N'钢结构课程设计(汉语)', CAST(1.5 AS Numeric(2, 1)), N'钱宏亮', N'土木工程系', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200162', N'钢结构课程设计（桥梁）(汉语)', CAST(1.5 AS Numeric(2, 1)), N'唐海红', N'土木工程系', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200163', N'桥梁工程课程设计(汉语)', CAST(1.5 AS Numeric(2, 1)), N'唐海红', N'土木工程系', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200164', N'认识实习(汉语)', CAST(1.0 AS Numeric(2, 1)), N'徐龙军', N'土木工程系', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200165', N'Go语言程序设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'张华', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200166', N'Python程序设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'张小东', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200167', N'人工智能导论(汉语)', CAST(2.0 AS Numeric(2, 1)), N'徐永东', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200168', N'机器学习概论(汉语)', CAST(2.0 AS Numeric(2, 1)), N'张盛平', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200169', N'Web信息处理(汉语)', CAST(2.0 AS Numeric(2, 1)), N'魏玉良', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200170', N'嵌入式系统设计与实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'柏军', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200171', N'嵌入式系统设计与实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'何燕平', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200172', N'嵌入式系统设计与实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'王翠华', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200173', N'嵌入式系统设计与实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'吕为工', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200174', N'计算机设计与实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'王翠华', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200175', N'计算机设计与实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'李剑雄', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200176', N'信息安全设计与实践II(汉语)', CAST(2.0 AS Numeric(2, 1)), N'张兆心', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200177', N'信息安全设计与实践II(汉语)', CAST(2.0 AS Numeric(2, 1)), N'许海燕', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200178', N'软件设计与开发实践II(汉语)', CAST(2.0 AS Numeric(2, 1)), N'张淼', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200179', N'网络空间安全设计与实践III(汉语)', CAST(2.0 AS Numeric(2, 1)), N'刘扬', N'计算机科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200180', N'认识实习(汉语)', CAST(1.0 AS Numeric(2, 1)), N'李湛', N'经济管理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200181', N'认识实习(汉语)', CAST(1.0 AS Numeric(2, 1)), N'张培英', N'经济管理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200182', N'认识实习(汉语)', CAST(1.0 AS Numeric(2, 1)), N'刘琼', N'经济管理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200183', N'认识实习(汉语)', CAST(1.0 AS Numeric(2, 1)), N'王冬梅', N'经济管理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200184', N'认识实习(汉语)', CAST(1.0 AS Numeric(2, 1)), N'何中兵', N'经济管理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200185', N'认识实习(汉语)', CAST(1.0 AS Numeric(2, 1)), N'史建锋', N'经济管理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200186', N'专业实习(汉语)', CAST(2.0 AS Numeric(2, 1)), N'张春瑞', N'经济管理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200187', N'专业实习(汉语)', CAST(4.0 AS Numeric(2, 1)), N'王冬梅', N'经济管理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200188', N'专业实习(汉语)', CAST(2.0 AS Numeric(2, 1)), N'何中兵', N'经济管理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200189', N'面向对象程序设计课程设计(汉语)', CAST(1.0 AS Numeric(2, 1)), N'杨美荣', N'经济管理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200190', N'数据结构课程设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'杨美荣', N'经济管理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200191', N'先进控制实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'马立勇', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200192', N'过程控制课程设计(汉语)', CAST(1.0 AS Numeric(2, 1)), N'张虹', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200193', N'测量仪器设计课程设计(汉语)', CAST(1.0 AS Numeric(2, 1)), N'邓立宝', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200194', N'通信网络仿真课程设计(汉语)', CAST(3.0 AS Numeric(2, 1)), N'刘功亮', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200195', N'数字图像处理课程设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'周志权', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200196', N'数字图像处理课程设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'赵占锋', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200197', N'数字图像处理课程设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'于海雁', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200198', N'数字信号处理课程设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'周志权', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200199', N'数字信号处理课程设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'赵占锋', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200200', N'数字信号处理课程设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'于海雁', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
GO
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200201', N'专业综合课程设计(汉语)', CAST(3.0 AS Numeric(2, 1)), N'刘帅', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200202', N'专业综合课程设计(汉语)', CAST(3.0 AS Numeric(2, 1)), N'金铭', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200203', N'专业综合课程设计(汉语)', CAST(3.0 AS Numeric(2, 1)), N'王军', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200204', N'专业综合课程设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'罗敏', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200205', N'电磁兼容原理课程设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'金涛', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200206', N'现代信号处理课程设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'陈铖', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200207', N'海洋探测综合课程设计(汉语)', CAST(3.0 AS Numeric(2, 1)), N'刘爱军', N'信息科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200208', N'诗歌创作(汉语)', CAST(3.0 AS Numeric(2, 1)), N'刘玮', N'语言文学学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200209', N'韩国语基础写作(外语)', CAST(1.0 AS Numeric(2, 1)), N'金鹤哲', N'语言文学学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200210', N'韩国语基础语法(外语)', CAST(1.0 AS Numeric(2, 1)), N'赫美萍', N'语言文学学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200211', N'韩国语会话实践(外语)', CAST(1.0 AS Numeric(2, 1)), N'朴昌镐', N'语言文学学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200212', N'语言实践（戏剧表演）(汉语)', CAST(1.0 AS Numeric(2, 1)), N'王军平', N'语言文学学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200213', N'语言实践（读书报告会）(汉语)', CAST(1.0 AS Numeric(2, 1)), N'苗勇刚', N'语言文学学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200214', N'创新实践（笔译工作坊）(外语)', CAST(1.0 AS Numeric(2, 1)), N'王军平', N'语言文学学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200215', N'创新实践（英语文学创作）(外语)', CAST(1.0 AS Numeric(2, 1)), N'苗勇刚', N'语言文学学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200216', N'语言实践（影视配音）(外语)', CAST(1.0 AS Numeric(2, 1)), N'金鹤哲', N'语言文学学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200217', N'创新实践（韩中笔译工作坊）(外语)', CAST(1.0 AS Numeric(2, 1)), N'赫美萍', N'语言文学学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200218', N'微积分A(1)(汉语)', CAST(6.5 AS Numeric(2, 1)), N'王雪臣', N'理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200219', N'微积分A(2)(汉语)', CAST(6.5 AS Numeric(2, 1)), N'姜薇', N'理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200220', N'微积分B(1)(汉语)', CAST(5.5 AS Numeric(2, 1)), N'马强', N'理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200221', N'微积分B(2)(汉语)', CAST(5.5 AS Numeric(2, 1)), N'于战华', N'理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200222', N'代数与几何(汉语)', CAST(4.0 AS Numeric(2, 1)), N'吕敬亮', N'理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200223', N'概率论与数理统计(汉语)', CAST(3.0 AS Numeric(2, 1)), N'钟云娇', N'理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200224', N'复变函数与积分变换(汉语)', CAST(3.0 AS Numeric(2, 1)), N'陈忠', N'理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200225', N'理学类学术论文写作入门(汉语)', CAST(1.0 AS Numeric(2, 1)), N'李文学', N'理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200226', N'复杂系统的数学理论研究(汉语)', CAST(1.0 AS Numeric(2, 1)), N'吴开宁', N'理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200227', N'学术论文写作实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'李文学', N'理学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200228', N'实验室安全与操作规范(汉语)', CAST(0.5 AS Numeric(2, 1)), N'吴来军', N'材料科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200229', N'三维造型软件训练(汉语)', CAST(1.0 AS Numeric(2, 1)), N'刘发', N'材料科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200230', N'电子封装基础实验(汉语)', CAST(1.0 AS Numeric(2, 1)), N'吴来军', N'材料科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200231', N'材料科学与工程综合实验(汉语)', CAST(2.0 AS Numeric(2, 1)), N'于静泊', N'材料科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200232', N'成型工艺及模具课程设计A', CAST(4.0 AS Numeric(2, 1)), N'于洋', N'材料科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200233', N'成型工艺及模具课程设计B', CAST(4.0 AS Numeric(2, 1)), N'于洋', N'材料科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200234', N'电子封装生产实习(汉语)', CAST(2.0 AS Numeric(2, 1)), N'徐鸿博', N'材料科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200235', N'电子封装国际标准认证(汉语)', CAST(1.0 AS Numeric(2, 1)), N'姚旺', N'材料科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200236', N'国际焊接工程师培训(汉语)', CAST(2.0 AS Numeric(2, 1)), N'赵洪运', N'材料科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200237', N'国际焊接工程师实训(汉语)', CAST(1.0 AS Numeric(2, 1)), N'于静泊', N'材料科学与工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200238', N'水泵与泵站课程设计(汉语)', CAST(1.5 AS Numeric(2, 1)), N'柳锋', N'海洋科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200239', N'固体废弃物处理与资源化', CAST(1.0 AS Numeric(2, 1)), N'张大伟', N'海洋科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200240', N'水污染控制工程(2)', CAST(1.5 AS Numeric(2, 1)), N'贾玉红', N'海洋科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200241', N'专业实习(汉语)', CAST(2.0 AS Numeric(2, 1)), N'郭长禄', N'海洋科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200242', N'菁英班暑期实习(汉语)', CAST(1.0 AS Numeric(2, 1)), N'郭长禄', N'海洋科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200243', N'化工原理课程设计(汉语)', CAST(1.5 AS Numeric(2, 1)), N'刘德丽', N'海洋科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200244', N'生产实习(汉语)', CAST(4.0 AS Numeric(2, 1)), N'刘德丽', N'海洋科学与技术学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200245', N'船舶专业英语(汉语)', CAST(1.0 AS Numeric(2, 1)), N'周培林', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200246', N'工程训练(近机类)(汉语)', CAST(3.0 AS Numeric(2, 1)), N'张凯', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200247', N'机械原理课程设计(汉语)', CAST(1.0 AS Numeric(2, 1)), N'刘会英', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200248', N'专业综合课程设计(汉语)', CAST(3.0 AS Numeric(2, 1)), N'吴健', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200250', N'认识实习(汉语)', CAST(1.0 AS Numeric(2, 1)), N'鲁国春', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200251', N'综合课程设计I(汉语)', CAST(2.0 AS Numeric(2, 1)), N'周军伟', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200252', N'船舶力学综合实验课(汉语)', CAST(1.0 AS Numeric(2, 1)), N'鞠晓群', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200253', N'船舶力学综合实验课(汉语)', CAST(1.0 AS Numeric(2, 1)), N'于东', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200254', N'船舶力学综合实验课(汉语)', CAST(1.0 AS Numeric(2, 1)), N'王威', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200255', N'机器人仿真与控制课程设计', CAST(3.0 AS Numeric(2, 1)), N'李哲', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200257', N'认识实习(汉语)', CAST(1.0 AS Numeric(2, 1)), N'黄博', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200258', N'机器人创新设计与制作(汉语)', CAST(2.0 AS Numeric(2, 1)), N'李哲', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200259', N'软件设计与开发实践II(汉语)', CAST(2.0 AS Numeric(2, 1)), N'张维刚', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200260', N'机械产品创新设计及仿真(汉语)', CAST(2.0 AS Numeric(2, 1)), N'姜雪', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200261', N'机械创新设计与制作(汉语)', CAST(2.0 AS Numeric(2, 1)), N'姜雪', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200262', N'海洋航行器创新设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'周军伟', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200263', N'海洋航行器制作(汉语)', CAST(2.0 AS Numeric(2, 1)), N'谢芳', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200264', N'Ansys流动仿真(汉语)', CAST(2.0 AS Numeric(2, 1)), N'宫晓博', N'船舶与海洋工程学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200265', N'大学物理A(2)(汉语)', CAST(4.0 AS Numeric(2, 1)), N'任守田', N'理学院.', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200266', N'大学物理B(汉语)', CAST(4.5 AS Numeric(2, 1)), N'韩艳华', N'理学院.', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200267', N'Matlab应用基础(汉语)', CAST(1.5 AS Numeric(2, 1)), N'焦威严', N'理学院.', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200268', N'光电信息自主设计实验(汉语)', CAST(1.0 AS Numeric(2, 1)), N'潘玉寨', N'理学院.', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200269', N'专业课程综合设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'郭冠军', N'理学院.', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200270', N'生产实习(汉语)', CAST(2.0 AS Numeric(2, 1)), N'王本阳', N'理学院.', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200271', N'三维机械造型设计(汉语)', CAST(2.0 AS Numeric(2, 1)), N'王富强', N'新能源学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200272', N'程序设计实践(汉语)', CAST(1.0 AS Numeric(2, 1)), N'丁建睿', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200273', N'程序设计实践(汉语)', CAST(1.0 AS Numeric(2, 1)), N'朱东杰', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200274', N'程序设计实践(汉语)', CAST(1.0 AS Numeric(2, 1)), N'辛国栋', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200275', N'程序设计实践(汉语)', CAST(1.0 AS Numeric(2, 1)), N'朴学峰', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200276', N'程序设计实践(汉语)', CAST(1.0 AS Numeric(2, 1)), N'韩希先', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200277', N'程序设计实践(汉语)', CAST(1.0 AS Numeric(2, 1)), N'王大顺', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200278', N'软件开发实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'辛国栋', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200279', N'软件开发实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'丁建睿', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200280', N'软件开发实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'朱东杰', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200281', N'软件开发实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'朴学峰', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200282', N'软件开发实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'韩希先', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200283', N'软件开发实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'张华', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200284', N'软件开发实践(汉语)', CAST(2.0 AS Numeric(2, 1)), N'胡鑫', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200285', N'工业实训(汉语)', CAST(2.0 AS Numeric(2, 1)), N'孟凡超', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200286', N'工业实训(汉语)', CAST(2.0 AS Numeric(2, 1)), N'王大顺', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200287', N'工业实训(汉语)', CAST(2.0 AS Numeric(2, 1)), N'陈彬', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200288', N'工业实训(汉语)', CAST(2.0 AS Numeric(2, 1)), N'涂志莹', N'软件学院', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200289', N'《春秋左传》导读', CAST(2.0 AS Numeric(2, 1)), N'马新伟', N'土木工程系', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200290', N'影视音乐赏析(汉语)', CAST(1.0 AS Numeric(2, 1)), N'黄文韬', N'思想政治理论教学部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200291', N'影视音乐赏析(汉语)', CAST(1.0 AS Numeric(2, 1)), N'黄文韬', N'思想政治理论教学部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200292', N'西方音乐概论(汉语)', CAST(1.0 AS Numeric(2, 1)), N'高岩', N'思想政治理论教学部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200293', N'西方音乐概论(汉语)', CAST(1.0 AS Numeric(2, 1)), N'高岩', N'思想政治理论教学部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200294', N'生态文明概论(汉语)', CAST(1.5 AS Numeric(2, 1)), N'叶平', N'思想政治理论教学部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200295', N'明清史专题', CAST(1.0 AS Numeric(2, 1)), N'李曰强', N'思想政治理论教学部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200296', N'色彩基础与实践', CAST(2.0 AS Numeric(2, 1)), N'夏天', N'思想政治理论教学部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200297', N'色彩基础与实践', CAST(2.0 AS Numeric(2, 1)), N'夏天', N'思想政治理论教学部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200298', N'对外贸易与中国的崛起', CAST(1.0 AS Numeric(2, 1)), N'王冬梅', N'经济管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200299', N'对外贸易与中国的崛起', CAST(1.0 AS Numeric(2, 1)), N'王冬梅', N'经济管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200300', N'生活中的金融学', CAST(1.0 AS Numeric(2, 1)), N'刘琼', N'经济管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200301', N'生活中的博弈论', CAST(1.5 AS Numeric(2, 1)), N'杨慧力', N'经济管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200302', N'西方经济学入门', CAST(2.0 AS Numeric(2, 1)), N'杨慧力', N'经济管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
GO
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200303', N'社会语言学概述(汉语)', CAST(1.0 AS Numeric(2, 1)), N'孟宇', N'语言文学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200304', N'数学建模与数学软件', CAST(2.0 AS Numeric(2, 1)), N'姜薇', N'理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200305', N'从量子到宇宙(汉语)', CAST(1.0 AS Numeric(2, 1)), N'高鹏', N'海洋科学与技术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200306', N'化学与社会(汉语)', CAST(1.0 AS Numeric(2, 1)), N'滕祥国', N'海洋科学与技术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200307', N'做自己的健康管理师(汉语)', CAST(1.5 AS Numeric(2, 1)), N'闫培生', N'海洋科学与技术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200308', N'海洋与全球环境变化', CAST(1.5 AS Numeric(2, 1)), N'戴纪翠', N'海洋科学与技术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200309', N'环境社会学', CAST(1.5 AS Numeric(2, 1)), N'叶平', N'海洋科学与技术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200310', N'运动损伤与急救(汉语)', CAST(1.0 AS Numeric(2, 1)), N'佟艳华', N'体育教学部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200311', N'运动损伤与急救(汉语)', CAST(1.0 AS Numeric(2, 1)), N'佟艳华', N'体育教学部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200312', N'社会体育学(汉语)', CAST(1.0 AS Numeric(2, 1)), N'戚俊娣', N'体育教学部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200313', N'社会体育学(汉语)', CAST(1.0 AS Numeric(2, 1)), N'戚俊娣', N'体育教学部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200314', N'体能训练理论与实践(汉语)', CAST(1.0 AS Numeric(2, 1)), N'郭树涛', N'体育教学部', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'哈尔滨工业大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200315', N'离散数学', CAST(3.0 AS Numeric(2, 1)), N'丁宁', N'电子信息与电气工程学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'上海交通大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200316', N'算法设计与实现', CAST(5.0 AS Numeric(2, 1)), N'李国强', N'电子信息与电气工程学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'上海交通大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200317', N'计算机系统基础(系统软件)', CAST(3.0 AS Numeric(2, 1)), N'陈榕', N'电子信息与电气工程学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'上海交通大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200318', N'互联网应用开发技术', CAST(4.0 AS Numeric(2, 1)), N'陈昊鹏', N'电子信息与电气工程学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'上海交通大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200319', N'数据库原理与技术', CAST(3.0 AS Numeric(2, 1)), N'蒋建伟', N'电子信息与电气工程学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'上海交通大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200320', N'计算机系统基础(组成)', CAST(3.0 AS Numeric(2, 1)), N'臧斌宇', N'电子信息与电气工程学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'上海交通大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200321', N'基本电路理论', CAST(4.0 AS Numeric(2, 1)), N'王昕', N'电子信息与电气工程学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'上海交通大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200322', N'航空航天概论', CAST(4.0 AS Numeric(2, 1)), N'刘洪', N'航空航天学院', N'航空航天', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'上海交通大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200323', N'工程、社会与职业伦理', CAST(2.0 AS Numeric(2, 1)), N'黄丹', N'航空航天学院', N'航空航天', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'上海交通大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200324', N'中国现代小说选读', CAST(2.0 AS Numeric(2, 1)), N'夏伟', N'人文学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'上海交通大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200325', N'新时代社会认知实践', CAST(2.0 AS Numeric(2, 1)), N'钱文韬', N'学指委、团委(含学生处、人武部)', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'上海交通大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200326', N'欧洲文化导论', CAST(2.0 AS Numeric(2, 1)), N'童剑平', N'外国语学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'上海交通大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200327', N'近现代中外关系', CAST(2.0 AS Numeric(2, 1)), N'李少军', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200328', N'中国古代数术文化', CAST(2.0 AS Numeric(2, 1)), N'晏昌贵', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200329', N'古典音乐大师', CAST(2.0 AS Numeric(2, 1)), N'江柏安', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200330', N'艺术鉴赏与批评导引', CAST(2.0 AS Numeric(2, 1)), N'王杰红', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200331', N'景观地学与欣赏', CAST(2.0 AS Numeric(2, 1)), N'刘小燕', N'土木建筑工程学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200332', N'古典音乐与西方文明', CAST(2.0 AS Numeric(2, 1)), N'葛佳嘉', N'艺术学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200333', N'诗词与人生', CAST(2.0 AS Numeric(2, 1)), N'程磊', N'文学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200334', N'心理咨询与治疗', CAST(2.0 AS Numeric(2, 1)), N'高倩', N'大学生心理健康中心', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200335', N'中国哲学智慧', CAST(2.0 AS Numeric(2, 1)), N'储昭华', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200336', N'哲学核心问题', CAST(2.0 AS Numeric(2, 1)), N'潘磊', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200337', N'心理学与生活', CAST(2.0 AS Numeric(2, 1)), N'刘毅', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200338', N'美的历程', CAST(2.0 AS Numeric(2, 1)), N'周祝红', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200339', N'古希腊文明', CAST(2.0 AS Numeric(2, 1)), N'赵林', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200340', N'《老子》《庄子》导读', CAST(2.0 AS Numeric(2, 1)), N'秦平', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200341', N'知心的艺术', CAST(2.0 AS Numeric(2, 1)), N'赵俊华', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200342', N'伦理学', CAST(2.0 AS Numeric(2, 1)), N'李勇', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200343', N'逻辑学导论', CAST(2.0 AS Numeric(2, 1)), N'杜珊珊', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200344', N'毕生发展心理学', CAST(2.0 AS Numeric(2, 1)), N'张春妹', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200345', N'中国禅宗思想史', CAST(2.0 AS Numeric(2, 1)), N'姚彬彬', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200346', N'辩论实践与鉴赏', CAST(2.0 AS Numeric(2, 1)), N'周玄毅', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200347', N'逻辑与思维导论', CAST(2.0 AS Numeric(2, 1)), N'费定舟', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200348', N'《狭义与广义相对论浅说》导读', CAST(2.0 AS Numeric(2, 1)), N'周祝红', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200349', N'宗教学概论', CAST(2.0 AS Numeric(2, 1)), N'翟志宏', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200350', N'人格心理学', CAST(2.0 AS Numeric(2, 1)), N'刘毅', N'哲学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200351', N'创业与法律', CAST(2.0 AS Numeric(2, 1)), N'曾咏梅', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200352', N'信息素养与科学发现', CAST(2.0 AS Numeric(2, 1)), N'滕冲', N'国家网络安全学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200353', N'中国小说与社会', CAST(2.0 AS Numeric(2, 1)), N'鲁小俊', N'文学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200354', N'海外中国形象史', CAST(2.0 AS Numeric(2, 1)), N'李会玲', N'文学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200355', N'战争史', CAST(2.0 AS Numeric(2, 1)), N'戴新武', N'军事教研室', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200356', N'中国古代数术文化', CAST(2.0 AS Numeric(2, 1)), N'晏昌贵', N'历史学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200357', N'行为健康', CAST(2.0 AS Numeric(2, 1)), N'王素青', N'健康学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200358', N'人类生物学', CAST(1.0 AS Numeric(2, 1)), N'周荣家', N'生命科学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200359', N'植物世界', CAST(2.0 AS Numeric(2, 1)), N'汪小凡', N'生命科学学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200360', N'饮食营养与健康', CAST(2.0 AS Numeric(2, 1)), N'汪春红', N'健康学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200361', N'营养学', CAST(2.0 AS Numeric(2, 1)), N'王素青', N'健康学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200362', N'环境健康学', CAST(2.0 AS Numeric(2, 1)), N'王红', N'健康学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200363', N'大学生健康', CAST(2.0 AS Numeric(2, 1)), N'刘晴', N'健康学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200364', N'大学生生活方式与健康', CAST(2.0 AS Numeric(2, 1)), N'何启强', N'健康学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200365', N'性与社会', CAST(2.0 AS Numeric(2, 1)), N'邹宇量', N'健康学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200366', N'当代经济与经济思想', CAST(2.0 AS Numeric(2, 1)), N'文建东', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200367', N'当代中国经济发展', CAST(2.0 AS Numeric(2, 1)), N'成德宁', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200368', N'博弈论', CAST(2.0 AS Numeric(2, 1)), N'范如国', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200369', N'当代国际经济热点问题', CAST(2.0 AS Numeric(2, 1)), N'胡艺', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200370', N'管理学原理', CAST(2.0 AS Numeric(2, 1)), N'卫武', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200371', N'世界经济史', CAST(2.0 AS Numeric(2, 1)), N'刁莉', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200372', N'税收与我们的生活', CAST(2.0 AS Numeric(2, 1)), N'王玮', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200373', N'创新思维与方法', CAST(2.0 AS Numeric(2, 1)), N'杜莉', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200374', N'人口、资源、环境与可持续发展', CAST(2.0 AS Numeric(2, 1)), N'钟水映', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200375', N'创业项目管理', CAST(2.0 AS Numeric(2, 1)), N'赖一飞', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200376', N'商务沟通与谈判', CAST(2.0 AS Numeric(2, 1)), N'余振', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200377', N'电子商务与新媒体营销', CAST(2.0 AS Numeric(2, 1)), N'廖以臣', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200378', N'创业与法律', CAST(2.0 AS Numeric(2, 1)), N'曾咏梅', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200379', N'现代管理者技能与艺术', CAST(2.0 AS Numeric(2, 1)), N'温兴琦', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200380', N'创业金融', CAST(2.0 AS Numeric(2, 1)), N'张东祥', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200381', N'创业营销', CAST(1.0 AS Numeric(2, 1)), N'汪涛', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200382', N'消费者心理与营销策略', CAST(2.0 AS Numeric(2, 1)), N'崔楠', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200383', N'创业运营管理', CAST(2.0 AS Numeric(2, 1)), N'徐晓辉', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200384', N'大数据背景下的营销思维', CAST(2.0 AS Numeric(2, 1)), N'朱华伟', N'经济与管理学院', NULL, NULL, N'2019-2020', 3, N'通识课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200385', N'认识实习', CAST(2.0 AS Numeric(2, 1)), N'田哲', N'轮机工程', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200386', N'电工电子实习', CAST(1.0 AS Numeric(2, 1)), N'刘贵杰', N'轮机工程', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200387', N'船体制图课程设计', CAST(1.0 AS Numeric(2, 1)), N'桑松', N'轮机工程', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200388', N'海洋-大气数据可视化', CAST(1.5 AS Numeric(2, 1)), N'姚志刚', N'海洋科学', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200389', N'大气科学概论', CAST(3.0 AS Numeric(2, 1)), N'卢艳', N'海洋科学', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200390', N'近海区域海洋学', CAST(2.0 AS Numeric(2, 1)), N'林霄沛', N'海洋科学', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200391', N'生物统计', CAST(3.0 AS Numeric(2, 1)), N'李文涛', N'海洋渔业与技术', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200392', N'水生生物学', CAST(3.0 AS Numeric(2, 1)), N'薛莹', N'海洋渔业与技术', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200393', N'海洋生物资源加工装备', CAST(2.0 AS Numeric(2, 1)), N'薛勇', N'海洋资源开发技术', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200394', N'船体制图', CAST(1.0 AS Numeric(2, 1)), N'桑松', N'船舶与海洋工程', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200395', N'船舶与海洋工程导论', CAST(2.0 AS Numeric(2, 1)), N'刘鹏', N'船舶与海洋工程', NULL, 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'中国海洋大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200396', N'计算机组成与设计课程设计', CAST(1.0 AS Numeric(2, 1)), N'蔡朝晖', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200397', N'计算机组成与设计课程设计', CAST(1.0 AS Numeric(2, 1)), N'龚奕利', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200398', N'计算机组成与设计课程设计', CAST(1.0 AS Numeric(2, 1)), N'徐爱萍', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200399', N'计算机组成与设计课程设计', CAST(1.0 AS Numeric(2, 1)), N'熊小兵', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200400', N'软件构造基础', CAST(3.0 AS Numeric(2, 1)), N'何政', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200401', N'软件构造基础', CAST(3.0 AS Numeric(2, 1)), N'祝园园', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200402', N'数据库系统', CAST(2.5 AS Numeric(2, 1)), N'安扬', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
GO
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200403', N'数据库系统', CAST(2.5 AS Numeric(2, 1)), N'方颖', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200404', N'数据库系统', CAST(2.5 AS Numeric(2, 1)), N'刘斌', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200405', N'数据库系统', CAST(2.5 AS Numeric(2, 1)), N'曾慧', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200406', N'数据库系统', CAST(2.5 AS Numeric(2, 1)), N'刘斌', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200407', N'计算机接口与通信', CAST(3.0 AS Numeric(2, 1)), N'傅佑铭', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200408', N'计算机接口与通信', CAST(3.0 AS Numeric(2, 1)), N'熊小兵', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200409', N'计算机接口与通信', CAST(3.0 AS Numeric(2, 1)), N'杭小庆', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200410', N'计算机接口与通信', CAST(3.0 AS Numeric(2, 1)), N'贺莲', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200411', N'计算机网络', CAST(3.0 AS Numeric(2, 1)), N'张沪寅', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200412', N'计算机网络', CAST(3.0 AS Numeric(2, 1)), N'徐武平', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200413', N'计算机网络', CAST(3.0 AS Numeric(2, 1)), N'吕慧', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200414', N'计算机网络', CAST(3.0 AS Numeric(2, 1)), N'牛晓光', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200415', N'操作系统', CAST(2.5 AS Numeric(2, 1)), N'曾平', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200416', N'操作系统', CAST(2.5 AS Numeric(2, 1)), N'李蓉蓉', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200417', N'操作系统', CAST(2.5 AS Numeric(2, 1)), N'宋伟', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200418', N'操作系统', CAST(2.5 AS Numeric(2, 1)), N'郑鹏', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200419', N'移动编程技术', CAST(2.0 AS Numeric(2, 1)), N'蒋华', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200420', N'移动编程技术', CAST(2.0 AS Numeric(2, 1)), N'黄文斌', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200421', N'移动编程技术', CAST(2.0 AS Numeric(2, 1)), N'高建华', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200422', N'组合数学', CAST(3.0 AS Numeric(2, 1)), N'姚昱', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200423', N'组合数学', CAST(3.0 AS Numeric(2, 1)), N'丁建利', N'计算机学院', N'计算机科学与技术', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200424', N'操作系统课程设计', CAST(1.0 AS Numeric(2, 1)), N'曾平', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200425', N'操作系统课程设计', CAST(1.0 AS Numeric(2, 1)), N'宋伟', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200426', N'操作系统课程设计', CAST(1.0 AS Numeric(2, 1)), N'蒋晶珏', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200427', N'软件工程概论', CAST(2.5 AS Numeric(2, 1)), N'李小红', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200428', N'软件工程概论', CAST(2.5 AS Numeric(2, 1)), N'何璐璐', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200429', N'软件工程概论', CAST(2.5 AS Numeric(2, 1)), N'李晓剑', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200430', N'软件构造基础', CAST(3.0 AS Numeric(2, 1)), N'贾向阳', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200431', N'数据库系统', CAST(2.5 AS Numeric(2, 1)), N'余伟', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200432', N'数据库系统', CAST(2.5 AS Numeric(2, 1)), N'李石君', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200433', N'数据库系统', CAST(2.5 AS Numeric(2, 1)), N'谭小琼', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200434', N'操作系统', CAST(2.5 AS Numeric(2, 1)), N'宋伟', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200435', N'操作系统', CAST(2.5 AS Numeric(2, 1)), N'蒋晶珏', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200436', N'操作系统', CAST(2.5 AS Numeric(2, 1)), N'陈珉', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200437', N'计算机接口与通信', CAST(3.0 AS Numeric(2, 1)), N'高戈', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200438', N'计算机接口与通信', CAST(3.0 AS Numeric(2, 1)), N'朱荣', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200439', N'移动编程技术', CAST(2.0 AS Numeric(2, 1)), N'黄文斌', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200440', N'移动编程技术', CAST(2.0 AS Numeric(2, 1)), N'高建华', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200441', N'移动编程技术', CAST(2.0 AS Numeric(2, 1)), N'蒋华', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200442', N'计算机网络', CAST(3.0 AS Numeric(2, 1)), N'周浩', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200443', N'计算机网络', CAST(3.0 AS Numeric(2, 1)), N'傅佑铭', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200444', N'计算机网络', CAST(3.0 AS Numeric(2, 1)), N'钱铁云', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200445', N'组合数学', CAST(3.0 AS Numeric(2, 1)), N'邹华', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200446', N'组合数学', CAST(3.0 AS Numeric(2, 1)), N'王玲玲', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200447', N'软件需求与建模', CAST(2.5 AS Numeric(2, 1)), N'李晓剑', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[bcourses] ([id], [cname], [credit], [tname], [academy], [major], [grade], [schoolyear], [schoolterm], [type], [remain/max], [timeandplace], [remark], [school]) VALUES (N'20200448', N'软件需求与建模', CAST(2.5 AS Numeric(2, 1)), N'王？', N'计算机学院', N'软件工程', 2018, N'2019-2020', 3, N'专业课', NULL, NULL, NULL, N'武汉大学')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'1', N'1', N'成功')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'2', N'2', N'成功')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'3', N'3', N'待审核')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'pzc', N'20200003', N'失败')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'pzc', N'20200009', N'成功')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'pzc', N'20200289', N'待审核')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'yjp', N'20200041', N'成功')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'lyq', N'8', N'成功')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'lyq', N'5', N'待审核')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'zyt', N'20200001', N'成功')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'lyq', N'3', N'成功')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'zyt', N'20200002', N'成功')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'lyq', N'1', N'待审核')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'lyq', N'2', N'待审核')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'zyt', N'20200003', N'待审核')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'zyt', N'20200005', N'待审核')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'pzc', N'20200403', N'成功')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'pzc', N'20200429', N'待审核')
INSERT [dbo].[uc] ([account], [courseid], [state]) VALUES (N'pzc', N'20200289', N'失败')
INSERT [dbo].[users] ([account], [password], [email], [ulevel]) VALUES (N'hly', N'lyq', N'804469151@qq.com', NULL)
INSERT [dbo].[users] ([account], [password], [email], [ulevel]) VALUES (N'lyq', N'123', N'1457380863@qq.com', NULL)
INSERT [dbo].[users] ([account], [password], [email], [ulevel]) VALUES (N'lyq067', N'lyq', N'462438167@qq.com', NULL)
INSERT [dbo].[users] ([account], [password], [email], [ulevel]) VALUES (N'lyq0671', N'lyq', N'1366338385@qq.com', NULL)
INSERT [dbo].[users] ([account], [password], [email], [ulevel]) VALUES (N'lyw', N'lyq', N'2098436503@qq.com', NULL)
INSERT [dbo].[users] ([account], [password], [email], [ulevel]) VALUES (N'peace&love', N'123', N'15859201728@163.com', NULL)
INSERT [dbo].[users] ([account], [password], [email], [ulevel]) VALUES (N'pzc', N'pzc', N'2427438398@qq.com', NULL)
INSERT [dbo].[users] ([account], [password], [email], [ulevel]) VALUES (N'yjp', N'lyq', N'2763871409@qq.com', NULL)
INSERT [dbo].[users] ([account], [password], [email], [ulevel]) VALUES (N'zyt', N'zyt', N'765096665@qq.com', NULL)
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "uc"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "bcourses"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 136
               Right = 385
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'application'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'application'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "uc"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "bcourses"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 136
               Right = 385
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'application2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'application2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "bcourses"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 10
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'gcourses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'gcourses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "bcourses"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 10
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'pcourses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'pcourses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "bcourses"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "uc"
            Begin Extent = 
               Top = 6
               Left = 243
               Bottom = 102
               Right = 385
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ucourses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ucourses'
GO
