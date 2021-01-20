import Level from './level';

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
  }

  restart() {
    this.level = new Level(this.dimensions);
    this.animate(this);

  } //to be written\
  //contains @level

  animate(ctx) {
    this.level.animate(ctx);
  } //
  //calls @level.animate();
}