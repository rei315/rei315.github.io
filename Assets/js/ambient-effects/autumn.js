(() => {
  const registry = window.AmbientEffects || (window.AmbientEffects = {});
  if (registry.autumn) return;

  registry.autumn = (canvas) => {
    if (!canvas || canvas.dataset.ambientStaticFilled) return;
    canvas.dataset.ambientStaticFilled = "true";

    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    const resize = () => {
      const dpr = Math.min(window.devicePixelRatio || 1, 2);
      const width = window.innerWidth;
      const height = window.innerHeight;
      canvas.style.width = `${width}px`;
      canvas.style.height = `${height}px`;
      canvas.width = Math.floor(width * dpr);
      canvas.height = Math.floor(height * dpr);
      ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
      ctx.clearRect(0, 0, width, height);
      ctx.fillStyle = "#ffffff";
      ctx.fillRect(0, 0, width, height);
    };

    resize();
    window.addEventListener("resize", resize);
  };
})();
