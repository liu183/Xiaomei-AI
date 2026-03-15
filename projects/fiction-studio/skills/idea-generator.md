---
name: idea-generator
description: Generate story ideas and plot concepts based on extensive inspiration libraries. / 基于灵感库生成故事创意和情节概念。支持世情、悬疑等多种类型。
parameters:
  - name: genre
    type: string
    description: Story genre type / 故事类型
    required: false
    enum:
      - world-affairs
      - suspense
      - romance
      - mystery
      - family-drama
    default: world-affairs
  - name: category
    type: string
    description: Specific category within genre / 类型下的具体分类
    required: false
  - name: theme
    type: string
    description: Core theme or topic / 核心主题
    required: false
  - name: twist
    type: string
    description: Desired plot twist direction / 期望的反转方向
    required: false
  - name: output_language
    type: string
    description: Output language / 输出语言
    required: false
    enum:
      - zh
      - en
      - bilingual
    default: zh
examples:
  - input:
      genre: world-affairs
      category: 婚姻家庭
      theme: 出轨
      output_language: zh
    output: Generate 3 story ideas about marital infidelity with different plot angles and character dynamics
  - input:
      genre: suspense
      theme: revenge
      twist: time-loop
      output_language: bilingual
    output: Generate suspense story ideas featuring revenge plots with time-loop mechanisms
---

# 灵感生成器 / Idea Generator

## 核心功能

基于海量真实素材库，为短篇小说创作提供灵感素材和创意方向。

**灵感库分类体系 / Inspiration Library Categories:**

### 世情灵感库

1. **恋爱相亲 / Dating & Marriage**
   - 普信男、老色皮、猥琐男、心机男、凤凰男
   - 海王、中央空调、妈宝男、油腻男、抠搜男
   - 相亲奇葩经历、初次见面冲突
   - 情感PUA、物质vs真心的矛盾

2. **婚姻家庭 / Marriage & Family**
   - 婆媳矛盾、姑嫂问题、妯娌关系
   - 出轨、家暴、冷暴力
   - 婚后财产纠纷、扶弟魔、凤凰男
   - 生育观念冲突、教育理念差异
   - 假离婚买房、真假离婚

3. **原生家庭 / Family of Origin**
   - 重男轻女、偏心、双标对待
   - 父母控制欲、道德绑架、情感勒索
   - 家族遗传病、精神疾病、残疾照顾
   - 继父母关系、重组家庭矛盾
   - 代际创伤、童年阴影

4. **婆媳关系 / Mother-in-law & Daughter-in-law**
   - 习惯冲突、育儿观念差异
   - 界限感缺失、过度干涉
   - 伪装善良、背后挑拨
   - 经济纠纷、养老责任

5. **奇葩人类 / Eccentric People**
   - 势利亲戚、双标朋友
   - 道德绑架、情感操控
   - 借钱不还、占便宜行为
   - 公共场所奇葩行为

6. **职场恶象 / Workplace Issues**
   - 性别歧视、学历歧视、年龄歧视
   - 抢单甩锅、办公室政治
   - 霸道老板、无理要求
   - 996加班、无偿劳动

### 悬疑灵感库

1. **犯罪手法 / Crime Methods**
   - 完美犯罪、密室杀人
   - 时间差诡计、身份替换
   - 心理操控、煤气灯效应

2. **复仇设定 / Revenge Themes**
   - 时间循环、身份互换
   - 借刀杀人、自毁式复仇
   - 多年布局、精心策划

3. **谜题设计 / Mystery Design**
   - 身份之谜、失踪之谜
   - 死因之谜、遗产之谜
   - 家族秘密、隐藏真相

4. **反转设定 / Plot Twists**
   - 虚假记忆、不可靠叙事者
   - 多重身份、隐藏关系
   - 善恶反转、受害者变成加害者

## 使用方法

### Step 1: 选择类型和分类
```
世情类：恋爱相亲、婚姻家庭、婆媳关系、原生家庭、奇葩人类、职场恶象
悬疑类：犯罪推理、心理惊悚、复仇悬疑、超自然悬疑
```

### Step 2: 确定核心冲突
从素材库中选择1-2个核心冲突元素：

**世情类冲突示例：**
- 相亲遇到普信男，对方条件一般却对女方评头论足
- 婆媳同住，婆婆毫无界限感
- 原生家庭偏心，要求主角为弟弟牺牲
- 职场遭遇性别歧视和潜规则

**悬疑类冲突示例：**
- 陷入时间循环，每次循环都会死亡
- 发现亲人并非表面那样简单
- 目击犯罪却无法证明
- 被指控犯罪，寻找真相

### Step 3: 添加反转元素
基于拆稿数据总结的反转技巧：

**常见反转模式：**
1. **身份反转** - 替身竟是白月光本人
2. **时间反转** - 以为是开始，其实是结尾
3. **动机反转** - 以为报仇，实为救赎
4. **关系反转** - 仇人其实是盟友
5. **记忆反转** - 记忆被篡改或虚构

### Step 4: 生成完整故事概念

输出包含：
- **核心梗概**（一句话概括）
- **主要人物**（2-4个关键角色）
- **核心冲突**（主角面对的困境）
- **反转方向**（故事的转折点）
- **情感内核**（探讨的主题）

## 实战模板

### 世情类故事模板

```
类型：_______
冲突源：_______
主角设定：_______
反派/障碍：_______
目标：_______
反转：_______

故事大纲：
开篇：主角处于_______状态，面临_______冲突
发展：_______，但遭遇_______阻碍
高潮：_______，揭示_______真相
结局：_______，获得_______成长
```

### 悬疑类故事模板

```
类型：_______
诡计/设定：_______
主角身份：_______
案件/危机：_______
线索：_______
反转：_______

故事大纲：
激励事件：主角发现/遭遇_______，陷入_______
调查/挣扎：_______，发现_______线索
危机升级：_______，_______死亡/危险
真相揭露：_______，原来_______
最终反转：_______，_______才是真相
```

## 技巧总结

**基于拆稿数据的创作规律：**

1. **开篇技巧**
   - 黄金前三章：必须在开篇建立强冲突
   - 悬念式开场：用反常现象引发好奇
   - 危机式开场：主角立即陷入困境

2. **冲突设计**
   - 一明一暗：表面冲突+隐藏危机
   - 层层递进：困难不断升级
   - 至暗时刻：看似无解的困境

3. **人物塑造**
   - 反差萌：外表vs内在的对比
   - 成长弧：从懦弱到勇敢/从自私到无私
   - 灰色地带：非黑即白的道德困境

4. **节奏控制**
   - 短篇字数：1-2万字
   - 分段节奏：每500-1000字一个小转折
   - 高潮密度：每2000-3000字一个强冲突点

5. **反转技巧**
   - 伏笔埋设：早期埋下看似无关的细节
   - 信息差：读者和角色知道的信息不对称
   - 多重反转：一个真相背后还有真相

---

**使用示例 / Usage Example:**

```
User: 我想写一个关于婆媳关系的世情小说，要有反转
Genre: 世情-婚姻家庭
Theme: 婆媳矛盾

生成概念：
- 核心梗概：女主以为婆婆是恶婆婆，实则婆婆在保护她免受更大伤害
- 主要人物：女主、婆婆、丈夫、丈夫前女友
- 核心冲突：婆婆过度干涉女主生活
- 反转方向：婆婆的"恶"都是为了掩盖丈夫的秘密
- 情感内核：探讨女性互助vs男性操控
```
