(() => {
  const canvas = document.getElementById("ambient-canvas");
  if (!canvas) return;

  const dataset = canvas.dataset || {};
  const season = dataset.ambientSeason || dataset.season || "winter";
  const registry = window.AmbientEffects || (window.AmbientEffects = {});

  const fallback = () => {
    if (typeof registry.default === "function") {
      registry.default(canvas, { season });
      return;
    }

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

  const runEffect = () => {
    const effect = registry[season] || registry.default;
    if (typeof effect === "function") {
      effect(canvas, { season });
    } else {
      fallback();
    }
  };

  if (registry[season]) {
    runEffect();
    return;
  }

  const script = document.createElement("script");
  script.src = `/js/ambient-effects/${season}.js`;
  script.async = true;
  script.onload = runEffect;
  script.onerror = fallback;
  document.head.appendChild(script);
})();
