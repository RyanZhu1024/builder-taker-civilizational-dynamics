# 建造者-攫取者文明动力学

这个仓库用于保存和展示一套关于文明变化的工作框架：

> 建造者通过打开新边疆创造新增剩余；攫取者通过控制入口捕获剩余。文明能否更新，取决于新的建造者能否打破旧地租结构，以及他们成功之后能否避免自己变成新的守门人。

## 文件结构

- `index.html`：GitHub Pages 首页目录索引。
- `articles/`：每篇主题文章的独立页面。
- `docs/framework.md`：理论框架的 Markdown 源文档。
- `docs/thought-starmap.md`：思想星图的 Markdown 源文档。
- `TODO.md`：把思想星图演化为可植入 LLM 的 Agent Core 的路线图。
- `styles.css`：网站样式。
- `scripts/publish-github-pages.sh`：创建 GitHub 仓库、推送项目、开启 GitHub Pages 的辅助脚本。

## 发布到 GitHub Pages

1. 安装并登录 GitHub CLI：

   ```bash
   gh auth login
   ```

2. 在本目录运行：

   ```bash
   ./scripts/publish-github-pages.sh YOUR_GITHUB_USERNAME builder-taker-civilizational-dynamics public
   ```

   GitHub 免费账号支持公开仓库的 GitHub Pages。如果要用私有仓库发布 Pages，需要确认你的 GitHub 计划支持。

3. 发布后网站地址会是：

   ```text
   https://YOUR_GITHUB_USERNAME.github.io/builder-taker-civilizational-dynamics/
   ```

## 保存策略

- 把 `docs/framework.md` 作为长期源文档。
- 未来新主题先放到 `docs/`，再在 `articles/` 下生成对应文章页。
- 每次有新文章时，更新 `index.html` 的目录卡片。
- 每次重要修订都提交 Git。
- 用 GitHub 保存完整版本历史。
- 当论证成熟后，可以导出 PDF 作为阶段性快照。
