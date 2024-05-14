project('wxwidgets_meson', 'cpp')
src = ['main.cpp']
wx_dep = dependency(
  'wxwidgets', version : '>=3.0.0', modules : ['std', 'stc'],
)
executable('wxwidgets_meson', src, dependencies: wx_dep)
