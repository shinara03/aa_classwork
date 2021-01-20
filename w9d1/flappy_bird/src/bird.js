export default class Bird {

    constructor(dimensions) {
        this.dimensions = dimensions;
        this.velocity = 0;
        // this.position = ctx.fillRect(this.dimensions.width/3, this.dimensions.height/2, this.dimensions.width, this.dimensions.height)
        this.position = [this.dimensions.width/3, this.dimensions.height/2];
    }

    drawBird(ctx) {
        ctx.fillStyle = "yellow";
        ctx.fillRect(this.position[0], this.position[1], 40, 30);
    }


}