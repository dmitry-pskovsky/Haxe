package view;
import flash.display.Sprite;

class BackgroundView extends Sprite {

	public function new() {
		super();
		
		this.graphics.beginFill(0xbbada0);
		this.graphics.drawRoundRect(0, 0, 520, 520, 15, 15);
		this.graphics.endFill();
		
		this.graphics.beginFill(0xcdc1b4);
		for (j in 0...4) {
			for (i in 0...4) {
				this.graphics.drawRoundRect(i * (GraphicConstants.SQUARE_SIZE + GraphicConstants.SQUARE_SPACE) + GraphicConstants.SQUARE_SPACE, 
				j * (GraphicConstants.SQUARE_SIZE + GraphicConstants.SQUARE_SPACE) + GraphicConstants.SQUARE_SPACE, GraphicConstants.SQUARE_SIZE, GraphicConstants.SQUARE_SIZE, 10, 10);
			}
		}
		this.graphics.endFill();
		
	}
	
}