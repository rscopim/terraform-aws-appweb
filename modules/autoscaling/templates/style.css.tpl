* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  background: radial-gradient(circle at top left, #1e293b, #020617 55%);
  color: #f8fafc;
}

.page {
  width: min(1180px, 92%);
  margin: 0 auto;
  padding: 56px 0;
}

.hero {
  padding: 56px;
  border-radius: 28px;
  background: linear-gradient(135deg, rgba(30, 41, 59, 0.95), rgba(15, 23, 42, 0.95));
  border: 1px solid rgba(148, 163, 184, 0.22);
  box-shadow: 0 30px 80px rgba(0, 0, 0, 0.4);
}

.badge {
  display: inline-block;
  padding: 9px 16px;
  border-radius: 999px;
  background: #2563eb;
  color: #fff;
  font-weight: 700;
  margin-bottom: 22px;
}

h1 {
  font-size: clamp(2.8rem, 7vw, 5rem);
  margin: 0 0 20px;
  letter-spacing: -2px;
}

.subtitle {
  max-width: 820px;
  font-size: 1.2rem;
  line-height: 1.8;
  color: #cbd5e1;
}

.actions {
  display: flex;
  gap: 14px;
  margin-top: 32px;
  flex-wrap: wrap;
}

.btn {
  text-decoration: none;
  padding: 14px 20px;
  border-radius: 14px;
  font-weight: 800;
  transition: 0.2s ease;
}

.btn.primary {
  background: #2563eb;
  color: #fff;
}

.btn.secondary {
  background: #334155;
  color: #fff;
}

.btn:hover {
  transform: translateY(-2px);
  filter: brightness(1.12);
}

.status-bar {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 16px;
  margin: 24px 0;
}

.status-bar div {
  padding: 18px 22px;
  border-radius: 18px;
  background: rgba(30, 41, 59, 0.85);
  border: 1px solid rgba(148, 163, 184, 0.2);
}

.status-bar span {
  display: block;
  color: #94a3b8;
  font-size: 0.9rem;
  margin-bottom: 6px;
}

.status-bar strong {
  color: #86efac;
}

.grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
}

.card {
  min-height: 210px;
  padding: 26px;
  border-radius: 24px;
  background: rgba(30, 41, 59, 0.9);
  border: 1px solid rgba(148, 163, 184, 0.2);
  box-shadow: 0 18px 44px rgba(0, 0, 0, 0.22);
}

.card.large {
  grid-column: span 2;
}

.card h2 {
  margin-top: 0;
  color: #93c5fd;
  font-size: 1.45rem;
}

.card p {
  color: #e2e8f0;
  line-height: 1.7;
  word-break: break-word;
}

.services {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin-top: 18px;
}

.services span {
  padding: 10px 13px;
  border-radius: 999px;
  background: #0f172a;
  border: 1px solid rgba(148, 163, 184, 0.25);
  color: #cbd5e1;
  font-size: 0.95rem;
}

.diagram {
  border-style: dashed;
  text-align: center;
}

@media (max-width: 980px) {
  .grid {
    grid-template-columns: repeat(2, 1fr);
  }

  .card.large {
    grid-column: span 2;
  }
}

@media (max-width: 640px) {
  .hero {
    padding: 34px;
  }

  .grid {
    grid-template-columns: 1fr;
  }

  .card.large {
    grid-column: span 1;
  }
}