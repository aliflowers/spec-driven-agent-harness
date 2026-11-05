#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

const pkgRoot = path.resolve(__dirname, '..');
const targetDir = process.cwd();

console.log('\n🛡️  \x1b[36mSpec-Driven Agent Harness\x1b[0m 🤖');
console.log('Deterministic, Shift-Left SDLC Harness for AI Coding Agents\n');

function copyDirSync(src, dest) {
  if (!fs.existsSync(dest)) {
    fs.mkdirSync(dest, { recursive: true });
  }
  const entries = fs.readdirSync(src, { withFileTypes: true });
  for (const entry of entries) {
    const srcPath = path.join(src, entry.name);
    const destPath = path.join(dest, entry.name);
    if (entry.isDirectory()) {
      copyDirSync(srcPath, destPath);
    } else {
      fs.copyFileSync(srcPath, destPath);
    }
  }
}

try {
  console.log(`📦 Initializing harness into: \x1b[33m${targetDir}\x1b[0m ...\n`);

  // 1. Copy AGENTS.md
  fs.copyFileSync(path.join(pkgRoot, 'AGENTS.md'), path.join(targetDir, 'AGENTS.md'));
  console.log('  ✔ AGENTS.md');

  // 2. Copy harness.config.json if not present
  const targetConfig = path.join(targetDir, 'harness.config.json');
  if (!fs.existsSync(targetConfig)) {
    fs.copyFileSync(path.join(pkgRoot, 'harness.config.example.json'), targetConfig);
    console.log('  ✔ harness.config.json');
  } else {
    console.log('  ℹ harness.config.json already exists (kept existing)');
  }

  // 3. Copy .agents/ (subagents, skills, adapters)
  copyDirSync(path.join(pkgRoot, '.agents'), path.join(targetDir, '.agents'));
  console.log('  ✔ .agents/ (subagents, skills, adapters)');

  // 4. Copy docs/templates/
  copyDirSync(path.join(pkgRoot, 'docs', 'templates'), path.join(targetDir, 'docs', 'templates'));
  console.log('  ✔ docs/templates/ (plan-template, mentor-log)');

  // 5. Copy scripts/
  copyDirSync(path.join(pkgRoot, 'scripts'), path.join(targetDir, 'scripts'));
  console.log('  ✔ scripts/ (git-hooks, installers)');

  // 6. Install Git hooks if .git directory exists
  const gitHooksDir = path.join(targetDir, '.git', 'hooks');
  if (fs.existsSync(gitHooksDir)) {
    const preCommitSrc = path.join(pkgRoot, 'scripts', 'git-hooks', 'pre-commit');
    const prePushSrc = path.join(pkgRoot, 'scripts', 'git-hooks', 'pre-push');
    if (fs.existsSync(preCommitSrc)) {
      fs.copyFileSync(preCommitSrc, path.join(gitHooksDir, 'pre-commit'));
      try { fs.chmodSync(path.join(gitHooksDir, 'pre-commit'), '755'); } catch (e) {}
    }
    if (fs.existsSync(prePushSrc)) {
      fs.copyFileSync(prePushSrc, path.join(gitHooksDir, 'pre-push'));
      try { fs.chmodSync(path.join(gitHooksDir, 'pre-push'), '755'); } catch (e) {}
    }
    console.log('  ✔ .git/hooks/ (deterministic branch locks active)');
  }

  console.log('\n\x1b[32m✅ Spec-Driven Agent Harness installed successfully!\x1b[0m');
  console.log('📖 Review AGENTS.md and customize harness.config.json to begin.\n');
  console.log('👤 Created by Jesús Flores (@aliflowers) | https://github.com/aliflowers\n');
} catch (err) {
  console.error('\x1b[31m❌ Installation failed:\x1b[0m', err.message);
  process.exit(1);
}
