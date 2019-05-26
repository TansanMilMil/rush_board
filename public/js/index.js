let settimeoutReload;

autoReload();

/** 自動更新 */
function autoReload() {
  settimeoutReload = setTimeout(() => {
    console.log('reload!');
    location.reload();
  }, 180000);
}