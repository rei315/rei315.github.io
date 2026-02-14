(() => {
  const registry = window.AmbientEffects || (window.AmbientEffects = {});
  if (registry.winter) return;

  registry.winter = (canvas) => {
    if (!canvas || canvas.dataset.ambientActive) return;
    canvas.dataset.ambientActive = "true";

    const prefersReducedMotion = window.matchMedia &&
      window.matchMedia("(prefers-reduced-motion: reduce)").matches;

    let dpr = Math.min(window.devicePixelRatio || 1, 2);
    let width = 0;
    let height = 0;
    let particles = [];
    let particleCount = 0;
    let lastTime = 0;
    let animationId = 0;

    let gl = canvas.getContext("webgl", { alpha: true, antialias: true });
    let ctx2d = null;
    let usingWebGL = !!gl;

    let program = null;
    let positionBuffer = null;
    let sizeBuffer = null;
    let alphaBuffer = null;
    let aPosition = null;
    let aSize = null;
    let aAlpha = null;
    let uResolution = null;

    let positions = new Float32Array(0);
    let sizes = new Float32Array(0);
    let alphas = new Float32Array(0);

    if (!usingWebGL) {
      ctx2d = canvas.getContext("2d");
    }

    const vertexShaderSource = `
      attribute vec2 a_position;
      attribute float a_size;
      attribute float a_alpha;
      uniform vec2 u_resolution;
      varying float v_alpha;

      void main() {
        vec2 zeroToOne = a_position / u_resolution;
        vec2 clipSpace = zeroToOne * 2.0 - 1.0;
        gl_Position = vec4(clipSpace * vec2(1.0, -1.0), 0.0, 1.0);
        gl_PointSize = a_size;
        v_alpha = a_alpha;
      }
    `;

    const fragmentShaderSource = `
      precision mediump float;
      varying float v_alpha;

      void main() {
        vec2 coord = gl_PointCoord - vec2(0.5);
        float dist = length(coord);
        float alpha = smoothstep(0.5, 0.1, dist) * v_alpha;
        gl_FragColor = vec4(1.0, 1.0, 1.0, alpha);
      }
    `;

    function createShader(type, source) {
      const shader = gl.createShader(type);
      gl.shaderSource(shader, source);
      gl.compileShader(shader);
      if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
        gl.deleteShader(shader);
        return null;
      }
      return shader;
    }

    function createProgram() {
      const vertexShader = createShader(gl.VERTEX_SHADER, vertexShaderSource);
      const fragmentShader = createShader(gl.FRAGMENT_SHADER, fragmentShaderSource);
      if (!vertexShader || !fragmentShader) return null;

      const shaderProgram = gl.createProgram();
      gl.attachShader(shaderProgram, vertexShader);
      gl.attachShader(shaderProgram, fragmentShader);
      gl.linkProgram(shaderProgram);

      if (!gl.getProgramParameter(shaderProgram, gl.LINK_STATUS)) {
        gl.deleteProgram(shaderProgram);
        return null;
      }

      return shaderProgram;
    }

    function initWebGL() {
      if (!gl) return;

      program = createProgram();
      if (!program) {
        usingWebGL = false;
        ctx2d = canvas.getContext("2d");
        return;
      }

      positionBuffer = gl.createBuffer();
      sizeBuffer = gl.createBuffer();
      alphaBuffer = gl.createBuffer();

      aPosition = gl.getAttribLocation(program, "a_position");
      aSize = gl.getAttribLocation(program, "a_size");
      aAlpha = gl.getAttribLocation(program, "a_alpha");
      uResolution = gl.getUniformLocation(program, "u_resolution");

      gl.useProgram(program);
      gl.enableVertexAttribArray(aPosition);
      gl.enableVertexAttribArray(aSize);
      gl.enableVertexAttribArray(aAlpha);
      gl.clearColor(0, 0, 0, 0);
      gl.enable(gl.BLEND);
      gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);
    }

    function createParticle(randomizeY = true) {
      const size = (1.5 + Math.random() * 3.5) * 2;
      return {
        x: Math.random() * width,
        y: randomizeY ? Math.random() * height : -Math.random() * height,
        size,
        speed: 18 + Math.random() * 52,
        drift: 12 + Math.random() * 28,
        alpha: 0.35 + Math.random() * 0.55,
        phase: Math.random() * Math.PI * 2,
      };
    }

    function configureParticles() {
      particleCount = Math.min(520, Math.max(120, Math.floor((width * height) / 6500)));
      particles = new Array(particleCount).fill(0).map(() => createParticle(true));
      positions = new Float32Array(particleCount * 2);
      sizes = new Float32Array(particleCount);
      alphas = new Float32Array(particleCount);
    }

    function resize() {
      dpr = Math.min(window.devicePixelRatio || 1, 2);
      width = window.innerWidth;
      height = window.innerHeight;

      canvas.style.width = `${width}px`;
      canvas.style.height = `${height}px`;
      canvas.width = Math.floor(width * dpr);
      canvas.height = Math.floor(height * dpr);

      if (usingWebGL && gl) {
        gl.viewport(0, 0, canvas.width, canvas.height);
      }

      configureParticles();
    }

    function updateParticles(delta, time) {
      const wind = Math.sin(time * 0.0002) * 18;

      for (let i = 0; i < particleCount; i++) {
        const particle = particles[i];
        particle.y += particle.speed * delta;
        particle.x += (Math.sin(time * 0.001 + particle.phase) * particle.drift + wind) * delta;

        if (particle.y > height + 40) {
          particles[i] = createParticle(false);
        }

        if (particle.x < -60) particle.x = width + 60;
        if (particle.x > width + 60) particle.x = -60;
      }
    }

    function drawWebGL(time, delta) {
      if (!gl || !program) return;

      updateParticles(delta, time);

      for (let i = 0; i < particleCount; i++) {
        const particle = particles[i];
        positions[i * 2] = particle.x * dpr;
        positions[i * 2 + 1] = particle.y * dpr;
        sizes[i] = particle.size * dpr;
        alphas[i] = particle.alpha;
      }

      gl.clear(gl.COLOR_BUFFER_BIT);
      gl.useProgram(program);
      gl.uniform2f(uResolution, canvas.width, canvas.height);

      gl.bindBuffer(gl.ARRAY_BUFFER, positionBuffer);
      gl.bufferData(gl.ARRAY_BUFFER, positions, gl.DYNAMIC_DRAW);
      gl.vertexAttribPointer(aPosition, 2, gl.FLOAT, false, 0, 0);

      gl.bindBuffer(gl.ARRAY_BUFFER, sizeBuffer);
      gl.bufferData(gl.ARRAY_BUFFER, sizes, gl.DYNAMIC_DRAW);
      gl.vertexAttribPointer(aSize, 1, gl.FLOAT, false, 0, 0);

      gl.bindBuffer(gl.ARRAY_BUFFER, alphaBuffer);
      gl.bufferData(gl.ARRAY_BUFFER, alphas, gl.DYNAMIC_DRAW);
      gl.vertexAttribPointer(aAlpha, 1, gl.FLOAT, false, 0, 0);

      gl.drawArrays(gl.POINTS, 0, particleCount);
    }

    function draw2d(time, delta) {
      if (!ctx2d) return;

      updateParticles(delta, time);
      ctx2d.clearRect(0, 0, canvas.width, canvas.height);
      ctx2d.save();
      ctx2d.scale(dpr, dpr);

      for (let i = 0; i < particleCount; i++) {
        const particle = particles[i];
        ctx2d.beginPath();
        ctx2d.fillStyle = `rgba(255, 255, 255, ${particle.alpha})`;
        ctx2d.arc(particle.x, particle.y, particle.size, 0, Math.PI * 2);
        ctx2d.fill();
      }

      ctx2d.restore();
    }

    function render(time) {
      const delta = Math.min((time - lastTime) / 1000, 0.033);
      lastTime = time;

      if (usingWebGL) {
        drawWebGL(time, delta);
      } else {
        draw2d(time, delta);
      }

      animationId = requestAnimationFrame(render);
    }

    function start() {
      if (usingWebGL) {
        initWebGL();
      }
      resize();

      if (prefersReducedMotion) {
        if (usingWebGL) {
          drawWebGL(0, 0.016);
        } else {
          draw2d(0, 0.016);
        }
        return;
      }

      lastTime = performance.now();
      animationId = requestAnimationFrame(render);
    }

    function stop() {
      if (animationId) {
        cancelAnimationFrame(animationId);
        animationId = 0;
      }
    }

    window.addEventListener("resize", () => {
      resize();
    });

    document.addEventListener("visibilitychange", () => {
      if (document.hidden) {
        stop();
      } else if (!prefersReducedMotion) {
        lastTime = performance.now();
        animationId = requestAnimationFrame(render);
      }
    });

    start();
  };
})();
