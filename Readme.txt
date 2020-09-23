		+---------------------------+
		|  DISTORT FUNCTION README  |
		+---------------------------+

		    +-- INTRODUCTION: --+

 "Distort" is a simple function that I wrote mainly for a
game I'm making, but I decided it was too cool to not share
it with others ;)

 It basically mixes all the pixels in an area of an
image, defined by a mask image. The result is much like
the invisibility effect used in the movie "The Predator",
very cool if you want a small, quick function for that
effect in your games!

		    +-- INSTRUCTIONS: --+

 Simply add the .bas file to your project to use it.
 All you need to do in order to activate the effect is to
call this function.

			+-- USAGE: --+

 Distort(Target As Long, Mask As Long, X As Long, Y As
Long, Width As Long, Height As Long)

		      +-- ARGUMENTS: --+

+- Target:
 This is the hDC where the effect will take place.
(You'll find this as a property of forms and picture
boxes.
 Just know that it refers to the image used in these
controls.)

+- Mask:
 This one is the hDC (same as above) of the mask. Use black
for the areas that will be used.

+- X:
 The X coordinate of the place where the effect will
appear (in the image, of course).

+- Y:
 The Y coordinate of the place where the effect will
appear.

+- Width:
 The width (in pixels) of the image contained in the hDC
given in the Target. If you're using a Form or a Picture
Box's hDC, you can just set that control's ScaleMode to
3 - Pixel and use here its ScaleWidth.

+- Height:
 The height (in pixels) of the image contained in the hDC
given in the Target. Same as above to ScaleWidth, but use
ScaleHeight instead here.

		       +--EXAMPLE: --+

 Check the sample project included for a working demo.

		+--------------------------+
		|  Made by Jotaf98         |
		|  (João F. S. Henriques)  |
		|                          |
		|  E-mail me at            |
		|  jotaf98@hotmail.com     |
		+--------------------------+