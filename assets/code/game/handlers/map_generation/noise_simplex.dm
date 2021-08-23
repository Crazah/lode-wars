/**
* K.jpg's OpenSimplex 2, faster variant
*
* - 2D is standard simplex implemented using a lookup table.
* - 3D is "Re-oriented 4-point BCC noise" which constructs a
*   congruent BCC lattice in a much different way than usual.
* - 4D constructs the lattice as a union of five copies of its
*   reciprocal. It successively finds the closest point on each.
*
* Multiple versions of each function are provided. See the
* documentation above each, for more info.
*
* Snippet transcribed to DM by KaioChao, original implementation found: https://github.com/KdotJPG/OpenSimplex2/blob/master/csharp/OpenSimplex2F.cs
*/

OpenSimplex2F
	var/const/PSIZE = 2048;
	var/const/PMASK = 2047;

	var/list/perm
	var/list/permGrad2

	New(seed)
		if(!GLOBAL_INITIALIZED)
			GLOBAL_INITIALIZE()

		perm = new(PSIZE)
		permGrad2 = new(PSIZE)

		var/list/source = new(PSIZE)
		for(var/i in 0 to PSIZE - 1)
			source[i + 1] = i
		for(var/i in PSIZE - 1 to 0 step -1)
			//seed = seed * 6364136223846793005 + 1442695040888963407;
			seed = seed * 63641362 + 144269504;
			var/r = (seed + 31) % (i + 1)
			if (r < 0)
				r += (i + 1);
			perm[i + 1] = source[r + 1];
			permGrad2[i + 1] = GRADIENTS_2D[perm[i + 1] + 1];
			source[r + 1] = source[i + 1];

	/*
	 * Noise Evaluators
	 */

	/**
	 * 2D Simplex noise, standard lattice orientation.
	 */
	proc/Noise2(x, y)

		// Get points for A2* lattice
		var/s = 0.366025403784439 * (x + y)
		var/xs = x + s, ys = y + s

		var/value = 0

		// Get base points and offsets
		var/xsb = fastFloor(xs), ysb = fastFloor(ys)
		var/xsi = xs - xsb, ysi = ys - ysb

		// Index to point list
		var/index = (ysi - xsi) / 2 + 1

		var/ssi = (xsi + ysi) * -0.211324865405187
		var/xi = xsi + ssi, yi = ysi + ssi

		// Point contributions
		for(var/i in 0 to 2)
			var/LatticePoint2D/c = LOOKUP_2D[index + i + 1]

			var/dx = xi + c.dx, dy = yi + c.dy;
			var/attn = 0.5 - dx * dx - dy * dy;
			if (attn <= 0) continue;

			var/pxm = (xsb + c.xsv) & PMASK, pym = (ysb + c.ysv) & PMASK;
			var/Grad2/grad = permGrad2[1 + (perm[1 + pxm] ^ pym)];
			var/extrapolation = grad.dx * dx + grad.dy * dy;

			attn *= attn;
			value += attn * attn * extrapolation;
		return value;

	/*
	 * Utility
	 */

	proc/fastFloor(x)
		return round(x)

	/*
	 * Lookup Tables & Gradients
	 */

	var/global/list/LOOKUP_2D = list(
	  new/LatticePoint2D(1, 0),
	  new/LatticePoint2D(0, 0),
	  new/LatticePoint2D(1, 1),
	  new/LatticePoint2D(0, 1))

	var/const/N2 = 0.01001634121365712
	var/const/N3 = 0.030485933181293584
	var/const/N4 = 0.009202377986303158

	var/global/list/GRADIENTS_2D
	var/global/GLOBAL_INITIALIZED

	proc/GLOBAL_INITIALIZE()
		GLOBAL_INITIALIZED = TRUE

		GRADIENTS_2D = new(PSIZE)

		var/list/grad2 = list(
			new/Grad2( 0.130526192220052,  0.99144486137381),
			new/Grad2( 0.38268343236509,   0.923879532511287),
			new/Grad2( 0.608761429008721,  0.793353340291235),
			new/Grad2( 0.793353340291235,  0.608761429008721),
			new/Grad2( 0.923879532511287,  0.38268343236509),
			new/Grad2( 0.99144486137381,   0.130526192220051),
			new/Grad2( 0.99144486137381,  -0.130526192220051),
			new/Grad2( 0.923879532511287, -0.38268343236509),
			new/Grad2( 0.793353340291235, -0.60876142900872),
			new/Grad2( 0.608761429008721, -0.793353340291235),
			new/Grad2( 0.38268343236509,  -0.923879532511287),
			new/Grad2( 0.130526192220052, -0.99144486137381),
			new/Grad2(-0.130526192220052, -0.99144486137381),
			new/Grad2(-0.38268343236509,  -0.923879532511287),
			new/Grad2(-0.608761429008721, -0.793353340291235),
			new/Grad2(-0.793353340291235, -0.608761429008721),
			new/Grad2(-0.923879532511287, -0.38268343236509),
			new/Grad2(-0.99144486137381,  -0.130526192220052),
			new/Grad2(-0.99144486137381,   0.130526192220051),
			new/Grad2(-0.923879532511287,  0.38268343236509),
			new/Grad2(-0.793353340291235,  0.608761429008721),
			new/Grad2(-0.608761429008721,  0.793353340291235),
			new/Grad2(-0.38268343236509,   0.923879532511287),
			new/Grad2(-0.130526192220052,  0.99144486137381))

		for (var/i in 0 to grad2.len - 1)
			grad2[i + 1].dx /= N2
			grad2[i + 1].dy /= N2

		for (var/i in 0 to PSIZE - 1)
			GRADIENTS_2D[i + 1] = grad2[i % grad2.len + 1]

LatticePoint2D
	var/xsv, ysv
	var/dx, dy

	New(xsv, ysv)
		src.xsv = xsv
		src.ysv = ysv
		var/ssv = (xsv + ysv) * -0.211324865405187
		dx = -xsv - ssv
		dy = -ysv - ssv

Grad2
	var/dx, dy

	New(dx, dy)
		src.dx = dx
		src.dy = dy
