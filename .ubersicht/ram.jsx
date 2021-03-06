import { css } from "uebersicht"

export const command = "vm_stat | awk '/Pages free:/ || /Pages wired down:/ || /Pages active:/'"

export const refreshFrequency = 5000 // ms

const YOUR_INSTALLED_RAM = 16; // GB

export const render = ({ output }) => {
  const data = output.match(/([0-9]+.)/mg);
  const values = data.toString().split('.,');
  const free = Number(values[0]);
  const active = Number(values[1]);
  const wired = Number(values[2].slice(0, -1));
  const availableRAM = (active + wired) * 4096 / 1000 / 1024 / 1024;
  const roundedRAM = availableRAM.toString().slice(0, 5);

  return(<div className={main}>
    <h1 className={count}>{(YOUR_INSTALLED_RAM - roundedRAM).toFixed(2)} GB</h1>
    <div className={bar}>
      <div className={barFill} style={{width: `${(roundedRAM / YOUR_INSTALLED_RAM) * 100 }%`}}></div>
    </div>
    <h2 className={label}>Available RAM</h2>
  </div>)
}

export const main = css`
  position: fixed;
  bottom: 6px;
  left: 50%;
  transform: translateX(-50%);
  font-family: system-ui, BlinkMacSystemFont, 'Segoe UI', sans-serif;
`

const count = css`
color: white;
margin: 0;
padding: 0;
line-height: 1;
font-weight: 300;
font-size: 20px;
text-align: center;
display: block;
font-variant-numeric: tabular-nums;
`

const label = css`
text-transform: uppercase;
color: white;
margin: 0;
padding: 0;
line-height: 1;
font-weight: 600;
font-size: 8px;
letter-spacing: 0.125em;
display: block;
text-align: center;
`

const bar = css`
width: 100%;
height: 5px;
background-color: rgba(0,0,0,.35);
border-radius: 6px;
text-align: center;
margin: 6px 0;
position: relative;
overflow: hidden;
`

const barFill = css`
background-color: hsla(140, 100%, 40%, 1);
height: 100%;

`
