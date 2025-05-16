import { css, html, LitElement } from 'https://esm.ext.archive.org/lit@^2.2.3';
import { unsafeHTML } from 'https://esm.ext.archive.org/lit@^2.2.3/directives/unsafe-html.js';

class IAIconBase extends LitElement {
  constructor(icon) {
    super();
    this.icon = icon;
  }

  static get styles() {
    return css`
      :host {
        width: var(--iconWidth, 'auto');
        height: var(--iconHeight, 'auto');
      }

      .fill-color {
        fill: var(--iconFillColor, 'black');
      }

      .stroke-color {
        stroke: var(--iconStrokeColor, 'black');
      }
    `;
  }

  render() {
    return html`${unsafeHTML(this.icon)}`;
  }
}

export default IAIconBase;
