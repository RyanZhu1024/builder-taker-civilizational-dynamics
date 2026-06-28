# TODO：思想星图到 Agent Core

目标：把“思想星图”从网页与文档，逐步做成可直接植入 LLM 的文件包和代码包。

最终形态不是一个固定 prompt，而是一套可审计、可扩展、可成长的个人思想操作系统：

```text
中心思想 = kernel
kernel = 实事求是：尊重客观事实、自然规律和真实人性
节点 = concepts / skills / loops
边 = reasoning links
LLM = 可替换 brain
ledger = 每次对话和行动的证据链
alarm = 逻辑矛盾、现实失败、价值漂移
growth loop = 把经验吸收回思想星图
```

## Phase 1：LLM 可植入文件包

- [ ] 设计 `agent-core/` 目录结构。
- [ ] 提取 `kernel.md`：中心思想、边界、价值原则、禁止漂移方向。
- [ ] 提取 `concepts/*.md`：每个思想节点一个独立 concept 文件。
- [ ] 提取 `links.json`：节点之间的逻辑边、依赖、冲突和推演关系。
- [ ] 提取 `operating-principles.md`：如何用这套思想回答人生、职业、代码、架构、文明问题。
- [ ] 提取 `evaluation-gates.md`：逻辑 gate、现实 gate、伦理 gate、可审计 gate。
- [ ] 提取 `growth-loop.md`：如何把新对话、新失败、新证据吸收回星图。

验收标准：

- [ ] 任意 LLM 只读取 `agent-core/` 文件包后，能稳定复述中心思想。
- [ ] LLM 能从中心思想推导人生规划、职业规划、代码架构、agent 设计等下游问题。
- [ ] LLM 能指出自己的回答属于哪个节点、经过哪些逻辑边。

## Phase 2：结构化 Schema

- [ ] 定义 `schema/node.schema.json`。
- [ ] 定义 `schema/link.schema.json`。
- [ ] 定义 `schema/gate.schema.json`。
- [ ] 定义 `schema/ledger-entry.schema.json`。
- [ ] 将思想星图从 HTML 内嵌 JS 数据迁移到 `data/starmap.json`。
- [ ] 让网页从 `data/starmap.json` 渲染，而不是手写节点。

验收标准：

- [ ] 星图页面与 LLM 文件包读取同一份结构化数据。
- [ ] 新增节点只需要更新数据文件，不需要改 HTML 逻辑。
- [ ] 每个节点都有 stable id、title、summary、principles、risks、gates、links。

## Phase 3：Runtime Prompt Pack

- [ ] 设计 `prompts/system.md`：作为 LLM agent 的系统思想内核。
- [ ] 设计 `prompts/session-start.md`：如何载入当前目标与上下文。
- [ ] 设计 `prompts/reasoning-map.md`：如何沿节点与边推演。
- [ ] 设计 `prompts/alarm-check.md`：如何发现逻辑矛盾、现实冲突、价值漂移。
- [ ] 设计 `prompts/growth-review.md`：如何在会话结束后提出可吸收经验。

验收标准：

- [ ] LLM 可以在不同模型之间迁移，保持核心思想一致。
- [ ] LLM 不依赖单次聊天记忆，也能从文件包恢复“我”的思想结构。
- [ ] LLM 会主动标注不确定性、风险和需要 gate 的地方。

## Phase 4：Agent Core 代码包

- [ ] 设计最小 TypeScript / Python runtime。
- [ ] 实现加载 `kernel + nodes + links + prompts` 的 core loader。
- [ ] 实现简单 query router：人生 / 职业 / 代码 / 架构 / 文明 / 投资 / agent 设计。
- [ ] 实现 ledger writer：记录问题、选中的节点、推演路径、结论、alarm。
- [ ] 实现 alarm detector：发现矛盾、过度推演、不可证伪、价值漂移。
- [ ] 实现 growth proposal：把高价值对话转成待审核节点或链接修改。

验收标准：

- [ ] 可以用任意兼容 LLM API 接入。
- [ ] 每次回答都有可回溯的 reasoning path。
- [ ] 系统不会自动修改核心思想，所有 growth proposal 必须人工审核。

## Phase 5：Self-Growth 但不自腐化

- [ ] 设计人工审核 gate：哪些经验可以 bake into kernel，哪些只能成为 notes。
- [ ] 设计版本系统：kernel、nodes、links、prompts 分别版本化。
- [ ] 设计 regression set：防止新吸收的经验破坏中心思想。
- [ ] 设计 drift alarm：当 agent 从开放入口、反黑箱、Builder 原则漂移时报警。

验收标准：

- [ ] 系统能成长，但不能悄悄改写中心思想。
- [ ] 所有重要变化都有 ledger、diff、理由和回滚路径。
- [ ] Agent Core 保持“可审计的另一个我”，而不是黑箱人格模拟。

## 近期下一步

- [ ] 把 `articles/thought-starmap.html` 里的节点数据抽成 `data/starmap.json`。
- [ ] 用 `data/starmap.json` 生成 `docs/thought-starmap.md` 的节点索引。
- [ ] 新增 `agent-core/kernel.md` 第一版。
- [ ] 新增 `agent-core/concepts/` 第一批节点文件。
- [ ] 设计第一个可植入 LLM 的 prompt pack。
