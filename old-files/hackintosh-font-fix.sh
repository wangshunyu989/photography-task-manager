#!/bin/bash 
 # 黑苹果字体渲染优化脚本 
 # 适用于 Samsung U28H750UQ 4K 显示器 
 # 创建时间：2026-03-13 
 
 echo "🍎 黑苹果字体优化 - Samsung 4K" 
 echo "================================" 
 
 # 设置字体平滑（2=中等，最细腻） 
 echo "→ 设置字体平滑..." 
 defaults -currentHost write -g AppleFontSmoothing -int 2 
 
 # 启用子像素抗锯齿 
 echo "→ 启用子像素渲染..." 
 defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO 
 
 # 设置子像素渲染强度 
 defaults write -g AppleFontSmoothingIntensity -float 0.7 
 
 # 禁用字体模糊 
 defaults write -g AppleAntiAliasingThreshold -int 1 
 
 # 清除字体缓存 
 echo "→ 清除字体缓存..." 
 sudo atsutil databases -remove 
 sudo atsutil server -shutdown 
 sudo atsutil server -ping 
 
 echo "" 
 echo "✅ 优化完成！" 
 echo "⚠️  请重启系统生效" 
 echo "" 
 echo "💡 建议：在 BetterDisplay 中开启 HiDPI 模式" 
 echo "   推荐分辨率：1920×1080 (HiDPI)"