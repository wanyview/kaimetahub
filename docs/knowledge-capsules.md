# 知识胶囊系统文档

## 概述

知识胶囊 (Knowledge Capsule) 是 KaiMetaHub 知识管理的核心单元。它是一种结构化的、可验证的、可进化的知识表示格式。

## 核心理念

### 为什么是"胶囊"？

传统知识存储有几个问题：
- **散落各处** - 笔记、文档、网页分散存储
- **无法追溯** - 不知道知识从哪里来、如何演进
- **质量不明** - 没有统一的质量评估标准

"胶囊"的隐喻解决了这些问题：
- **封装完整** - 包含内容、元数据、质量信息
- **可追溯** - 记录进化历史
- **可验证** - 质量评分机制

## 数据结构

```json
{
  "asset_id": "sha256-hash",
  "content": {
    "title": "文章标题",
    "body": "主体内容",
    "summary": "一句话总结"
  },
  "metadata": {
    "author": "creator-id",
    "created_at": "2026-02-25T00:00:00Z",
    "tags": ["AI", "知识管理"],
    "language": "zh-CN"
  },
  "evolution": [
    {
      "parent_id": "abc123",
      "type": "extension",
      "changes": ["添加了新案例", "更新了数据"],
      "timestamp": "2026-02-25T10:00:00Z"
    }
  ],
  "outcome": {
    "score": 0.85,
    "dimensions": {
      "accuracy": 0.90,
      "depth": 0.85,
      "novelty": 0.80,
      "utility": 0.80
    },
    "validators": 5,
    "validated_at": "2026-02-25T12:00:00Z"
  }
}
```

## 核心特性

### 1. 内容寻址

每个胶囊通过内容生成唯一ID：

```python
import hashlib

def create_asset_id(content: str) -> str:
    return hashlib.sha256(content.encode()).hexdigest()
```

这确保了：
- 内容不可篡改
- 相同内容产生相同ID
- 可以验证内容的真实性

### 2. 进化追踪

胶囊不是静态的——它们可以迭代进化：

```json
{
  "evolution": [
    {
      "parent_id": "原始胶囊ID",
      "type": "extension|refinement|correction",
      "changes": ["变更描述"],
      "timestamp": "时间戳"
    }
  ]
}
```

### 3. DATM评分

Decentralized Autonomous Trust Mechanism (DATM) 评估胶囊质量：

| 维度 | 权重 | 说明 |
|------|------|------|
| 准确性 | 30% | 事实正确、来源可靠 |
| 深度 | 25% | 解释透彻、覆盖全面 |
| 创新 | 25% | 视角独特、见解新颖 |
| 实用性 | 20% | 可操作、可落地 |

**评分规则**：
- 分数 ≥ 0.7：自动推广
- 分数 0.5-0.7：正常展示
- 分数 < 0.5：标记待审核

## API 接口

### 创建胶囊

```bash
POST /api/capsule/create
Content-Type: application/json

{
  "content": { ... },
  "metadata": { ... }
}
```

### 获取胶囊

```bash
GET /api/capsule/get/{asset_id}
```

### 搜索胶囊

```bash
POST /api/capsule/search
Content-Type: application/json

{
  "query": "搜索关键词",
  "tags": ["标签过滤"],
  "min_score": 0.7
}
```

### 胶囊进化

```bash
POST /api/capsule/evolve
Content-Type: application/json

{
  "parent_id": "原始胶囊ID",
  "content": { ... },
  "changes": ["变更描述"]
}
```

## 应用场景

### 个人知识管理
- 将阅读笔记转化为胶囊
- 沉淀实践经验
- 系统化思考结晶

### 团队知识共享
- 将专家经验转化为胶囊
- 沉淀项目教训
- 传承组织智慧

### 知识交易
- 有价值的胶囊可以分享
- 优质胶囊可以交易
- 持续输出建立个人品牌

---

## 相关链接

- [GitHub仓库](https://github.com/wanyview/kaimetahub)
- [KaiMetaHub首页](../README.md)
