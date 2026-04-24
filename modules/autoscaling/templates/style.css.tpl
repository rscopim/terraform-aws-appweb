* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  background: #0f172a;
  color: #f8fafc;
}

.page {
  width: min(1100px, 92%);
  margin: 0 auto;
  padding: 56px 0;
}

.hero {
  padding: 48px;
  border-radius: 24px;
  background: linear-gradient(135deg, #1e293b, #0f172a);
  border: 1px solid rgba(255, 255, 255, 0.12);
  box-shadow: 0 24px 60px rgba(0, 0, 0, 0.35);
}

.badge {
  display: inline-block;
  padding: 8px 14px;
  border-radius: 999px;
  background: #2563eb;
  font-weight: 700;
  margin-bottom: 18px;
}

h1 {
  font-size: clamp(2.5rem, 6vw, 4.5rem);
  margin: 0 0 18px;
}

.subtitle {
  max-width: 760px;
  font-size: 1.2rem;
  line-height: 1.7;
  color: #cbd5e1;
}

.actions {
  display: flex;
  gap: 14px;
  margin-top: 28px;
  flex-wrap: wrap;
}

.actions a {
  color: #f8fafc;
  text-decoration: none;
  padding: 12px 18px;
  border-radius: 12px;
  background: #334155;
  font-weight: 700;
}

.actions a:hover {
  background: #475569;
}

.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 18px;
  margin-top: 24px;
}

.card,
.diagram-placeholder {
  padding: 24px;
  border-radius: 20px;
  background: #1e293b;
  border: 1px solid rgba(255, 255, 255, 0.1);
}

.card h2,
.diagram-placeholder h2 {
  margin-top: 0;
  color: #93c5fd;
}

.card p,
.card li,
.diagram-placeholder p {
  color: #cbd5e1;
  line-height: 1.6;
}

.diagram-placeholder {
  margin-top: 24px;
  text-align: center;
  border-style: dashed;
}