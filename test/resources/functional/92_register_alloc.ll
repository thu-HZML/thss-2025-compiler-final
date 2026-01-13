declare i32 @getint()
declare i32 @getch()
declare float @getfloat()
declare i32 @getarray(i32*)
declare i32 @getfarray(float*)
declare void @putint(i32)
declare void @putch(i32)
declare void @putfloat(float)
declare void @putarray(i32, i32*)
declare void @putfarray(i32, float*)
declare void @starttime()
declare void @stoptime()

@a1 = dso_local global i32 1, align 4
@a2 = dso_local global i32 2, align 4
@a3 = dso_local global i32 3, align 4
@a4 = dso_local global i32 4, align 4
@a5 = dso_local global i32 5, align 4
@a6 = dso_local global i32 6, align 4
@a7 = dso_local global i32 7, align 4
@a8 = dso_local global i32 8, align 4
@a9 = dso_local global i32 9, align 4
@a10 = dso_local global i32 10, align 4
@a11 = dso_local global i32 11, align 4
@a12 = dso_local global i32 12, align 4
@a13 = dso_local global i32 13, align 4
@a14 = dso_local global i32 14, align 4
@a15 = dso_local global i32 15, align 4
@a16 = dso_local global i32 16, align 4
@a17 = dso_local global i32 1, align 4
@a18 = dso_local global i32 2, align 4
@a19 = dso_local global i32 3, align 4
@a20 = dso_local global i32 4, align 4
@a21 = dso_local global i32 5, align 4
@a22 = dso_local global i32 6, align 4
@a23 = dso_local global i32 7, align 4
@a24 = dso_local global i32 8, align 4
@a25 = dso_local global i32 9, align 4
@a26 = dso_local global i32 10, align 4
@a27 = dso_local global i32 11, align 4
@a28 = dso_local global i32 12, align 4
@a29 = dso_local global i32 13, align 4
@a30 = dso_local global i32 14, align 4
@a31 = dso_local global i32 15, align 4
@a32 = dso_local global i32 16, align 4

define i32 @func(i32 %arg0, i32 %arg1) {
entry0:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  %3 = load i32, i32* %0, align 4
  %4 = load i32, i32* %1, align 4
  %5 = add i32 %3, %4
  store i32 %5, i32* %2, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = call i32 @getint()
  store i32 %42, i32* %6, align 4
  %43 = call i32 @getint()
  store i32 %43, i32* %7, align 4
  %44 = call i32 @getint()
  store i32 %44, i32* %8, align 4
  %45 = call i32 @getint()
  store i32 %45, i32* %9, align 4
  %46 = load i32, i32* %6, align 4
  %47 = add i32 1, %46
  %48 = load i32, i32* @a1, align 4
  %49 = add i32 %47, %48
  store i32 %49, i32* %10, align 4
  %50 = load i32, i32* %7, align 4
  %51 = add i32 2, %50
  %52 = load i32, i32* @a2, align 4
  %53 = add i32 %51, %52
  store i32 %53, i32* %11, align 4
  %54 = load i32, i32* %8, align 4
  %55 = add i32 3, %54
  %56 = load i32, i32* @a3, align 4
  %57 = add i32 %55, %56
  store i32 %57, i32* %12, align 4
  %58 = load i32, i32* %9, align 4
  %59 = add i32 4, %58
  %60 = load i32, i32* @a4, align 4
  %61 = add i32 %59, %60
  store i32 %61, i32* %13, align 4
  %62 = load i32, i32* %10, align 4
  %63 = add i32 1, %62
  %64 = load i32, i32* @a5, align 4
  %65 = add i32 %63, %64
  store i32 %65, i32* %14, align 4
  %66 = load i32, i32* %11, align 4
  %67 = add i32 2, %66
  %68 = load i32, i32* @a6, align 4
  %69 = add i32 %67, %68
  store i32 %69, i32* %15, align 4
  %70 = load i32, i32* %12, align 4
  %71 = add i32 3, %70
  %72 = load i32, i32* @a7, align 4
  %73 = add i32 %71, %72
  store i32 %73, i32* %16, align 4
  %74 = load i32, i32* %13, align 4
  %75 = add i32 4, %74
  %76 = load i32, i32* @a8, align 4
  %77 = add i32 %75, %76
  store i32 %77, i32* %17, align 4
  %78 = load i32, i32* %14, align 4
  %79 = add i32 1, %78
  %80 = load i32, i32* @a9, align 4
  %81 = add i32 %79, %80
  store i32 %81, i32* %18, align 4
  %82 = load i32, i32* %15, align 4
  %83 = add i32 2, %82
  %84 = load i32, i32* @a10, align 4
  %85 = add i32 %83, %84
  store i32 %85, i32* %19, align 4
  %86 = load i32, i32* %16, align 4
  %87 = add i32 3, %86
  %88 = load i32, i32* @a11, align 4
  %89 = add i32 %87, %88
  store i32 %89, i32* %20, align 4
  %90 = load i32, i32* %17, align 4
  %91 = add i32 4, %90
  %92 = load i32, i32* @a12, align 4
  %93 = add i32 %91, %92
  store i32 %93, i32* %21, align 4
  %94 = load i32, i32* %18, align 4
  %95 = add i32 1, %94
  %96 = load i32, i32* @a13, align 4
  %97 = add i32 %95, %96
  store i32 %97, i32* %22, align 4
  %98 = load i32, i32* %19, align 4
  %99 = add i32 2, %98
  %100 = load i32, i32* @a14, align 4
  %101 = add i32 %99, %100
  store i32 %101, i32* %23, align 4
  %102 = load i32, i32* %20, align 4
  %103 = add i32 3, %102
  %104 = load i32, i32* @a15, align 4
  %105 = add i32 %103, %104
  store i32 %105, i32* %24, align 4
  %106 = load i32, i32* %21, align 4
  %107 = add i32 4, %106
  %108 = load i32, i32* @a16, align 4
  %109 = add i32 %107, %108
  store i32 %109, i32* %25, align 4
  %110 = load i32, i32* %22, align 4
  %111 = add i32 1, %110
  %112 = load i32, i32* @a17, align 4
  %113 = add i32 %111, %112
  store i32 %113, i32* %26, align 4
  %114 = load i32, i32* %23, align 4
  %115 = add i32 2, %114
  %116 = load i32, i32* @a18, align 4
  %117 = add i32 %115, %116
  store i32 %117, i32* %27, align 4
  %118 = load i32, i32* %24, align 4
  %119 = add i32 3, %118
  %120 = load i32, i32* @a19, align 4
  %121 = add i32 %119, %120
  store i32 %121, i32* %28, align 4
  %122 = load i32, i32* %25, align 4
  %123 = add i32 4, %122
  %124 = load i32, i32* @a20, align 4
  %125 = add i32 %123, %124
  store i32 %125, i32* %29, align 4
  %126 = load i32, i32* %26, align 4
  %127 = add i32 1, %126
  %128 = load i32, i32* @a21, align 4
  %129 = add i32 %127, %128
  store i32 %129, i32* %30, align 4
  %130 = load i32, i32* %27, align 4
  %131 = add i32 2, %130
  %132 = load i32, i32* @a22, align 4
  %133 = add i32 %131, %132
  store i32 %133, i32* %31, align 4
  %134 = load i32, i32* %28, align 4
  %135 = add i32 3, %134
  %136 = load i32, i32* @a23, align 4
  %137 = add i32 %135, %136
  store i32 %137, i32* %32, align 4
  %138 = load i32, i32* %29, align 4
  %139 = add i32 4, %138
  %140 = load i32, i32* @a24, align 4
  %141 = add i32 %139, %140
  store i32 %141, i32* %33, align 4
  %142 = load i32, i32* %30, align 4
  %143 = add i32 1, %142
  %144 = load i32, i32* @a25, align 4
  %145 = add i32 %143, %144
  store i32 %145, i32* %34, align 4
  %146 = load i32, i32* %31, align 4
  %147 = add i32 2, %146
  %148 = load i32, i32* @a26, align 4
  %149 = add i32 %147, %148
  store i32 %149, i32* %35, align 4
  %150 = load i32, i32* %32, align 4
  %151 = add i32 3, %150
  %152 = load i32, i32* @a27, align 4
  %153 = add i32 %151, %152
  store i32 %153, i32* %36, align 4
  %154 = load i32, i32* %33, align 4
  %155 = add i32 4, %154
  %156 = load i32, i32* @a28, align 4
  %157 = add i32 %155, %156
  store i32 %157, i32* %37, align 4
  %158 = load i32, i32* %34, align 4
  %159 = add i32 1, %158
  %160 = load i32, i32* @a29, align 4
  %161 = add i32 %159, %160
  store i32 %161, i32* %38, align 4
  %162 = load i32, i32* %35, align 4
  %163 = add i32 2, %162
  %164 = load i32, i32* @a30, align 4
  %165 = add i32 %163, %164
  store i32 %165, i32* %39, align 4
  %166 = load i32, i32* %36, align 4
  %167 = add i32 3, %166
  %168 = load i32, i32* @a31, align 4
  %169 = add i32 %167, %168
  store i32 %169, i32* %40, align 4
  %170 = load i32, i32* %37, align 4
  %171 = add i32 4, %170
  %172 = load i32, i32* @a32, align 4
  %173 = add i32 %171, %172
  store i32 %173, i32* %41, align 4
  %174 = load i32, i32* %0, align 4
  %175 = load i32, i32* %1, align 4
  %176 = sub i32 %174, %175
  %177 = add i32 %176, 10
  store i32 %177, i32* %2, align 4
  %178 = load i32, i32* %34, align 4
  %179 = add i32 1, %178
  %180 = load i32, i32* @a29, align 4
  %181 = add i32 %179, %180
  store i32 %181, i32* %38, align 4
  %182 = load i32, i32* %35, align 4
  %183 = add i32 2, %182
  %184 = load i32, i32* @a30, align 4
  %185 = add i32 %183, %184
  store i32 %185, i32* %39, align 4
  %186 = load i32, i32* %36, align 4
  %187 = add i32 3, %186
  %188 = load i32, i32* @a31, align 4
  %189 = add i32 %187, %188
  store i32 %189, i32* %40, align 4
  %190 = load i32, i32* %37, align 4
  %191 = add i32 4, %190
  %192 = load i32, i32* @a32, align 4
  %193 = add i32 %191, %192
  store i32 %193, i32* %41, align 4
  %194 = load i32, i32* %30, align 4
  %195 = add i32 1, %194
  %196 = load i32, i32* @a25, align 4
  %197 = add i32 %195, %196
  store i32 %197, i32* %34, align 4
  %198 = load i32, i32* %31, align 4
  %199 = add i32 2, %198
  %200 = load i32, i32* @a26, align 4
  %201 = add i32 %199, %200
  store i32 %201, i32* %35, align 4
  %202 = load i32, i32* %32, align 4
  %203 = add i32 3, %202
  %204 = load i32, i32* @a27, align 4
  %205 = add i32 %203, %204
  store i32 %205, i32* %36, align 4
  %206 = load i32, i32* %33, align 4
  %207 = add i32 4, %206
  %208 = load i32, i32* @a28, align 4
  %209 = add i32 %207, %208
  store i32 %209, i32* %37, align 4
  %210 = load i32, i32* %26, align 4
  %211 = add i32 1, %210
  %212 = load i32, i32* @a21, align 4
  %213 = add i32 %211, %212
  store i32 %213, i32* %30, align 4
  %214 = load i32, i32* %27, align 4
  %215 = add i32 2, %214
  %216 = load i32, i32* @a22, align 4
  %217 = add i32 %215, %216
  store i32 %217, i32* %31, align 4
  %218 = load i32, i32* %28, align 4
  %219 = add i32 3, %218
  %220 = load i32, i32* @a23, align 4
  %221 = add i32 %219, %220
  store i32 %221, i32* %32, align 4
  %222 = load i32, i32* %29, align 4
  %223 = add i32 4, %222
  %224 = load i32, i32* @a24, align 4
  %225 = add i32 %223, %224
  store i32 %225, i32* %33, align 4
  %226 = load i32, i32* %22, align 4
  %227 = add i32 1, %226
  %228 = load i32, i32* @a17, align 4
  %229 = add i32 %227, %228
  store i32 %229, i32* %26, align 4
  %230 = load i32, i32* %23, align 4
  %231 = add i32 2, %230
  %232 = load i32, i32* @a18, align 4
  %233 = add i32 %231, %232
  store i32 %233, i32* %27, align 4
  %234 = load i32, i32* %24, align 4
  %235 = add i32 3, %234
  %236 = load i32, i32* @a19, align 4
  %237 = add i32 %235, %236
  store i32 %237, i32* %28, align 4
  %238 = load i32, i32* %25, align 4
  %239 = add i32 4, %238
  %240 = load i32, i32* @a20, align 4
  %241 = add i32 %239, %240
  store i32 %241, i32* %29, align 4
  %242 = load i32, i32* %18, align 4
  %243 = add i32 1, %242
  %244 = load i32, i32* @a13, align 4
  %245 = add i32 %243, %244
  store i32 %245, i32* %22, align 4
  %246 = load i32, i32* %19, align 4
  %247 = add i32 2, %246
  %248 = load i32, i32* @a14, align 4
  %249 = add i32 %247, %248
  store i32 %249, i32* %23, align 4
  %250 = load i32, i32* %20, align 4
  %251 = add i32 3, %250
  %252 = load i32, i32* @a15, align 4
  %253 = add i32 %251, %252
  store i32 %253, i32* %24, align 4
  %254 = load i32, i32* %21, align 4
  %255 = add i32 4, %254
  %256 = load i32, i32* @a16, align 4
  %257 = add i32 %255, %256
  store i32 %257, i32* %25, align 4
  %258 = load i32, i32* %14, align 4
  %259 = add i32 1, %258
  %260 = load i32, i32* @a9, align 4
  %261 = add i32 %259, %260
  store i32 %261, i32* %18, align 4
  %262 = load i32, i32* %15, align 4
  %263 = add i32 2, %262
  %264 = load i32, i32* @a10, align 4
  %265 = add i32 %263, %264
  store i32 %265, i32* %19, align 4
  %266 = load i32, i32* %16, align 4
  %267 = add i32 3, %266
  %268 = load i32, i32* @a11, align 4
  %269 = add i32 %267, %268
  store i32 %269, i32* %20, align 4
  %270 = load i32, i32* %17, align 4
  %271 = add i32 4, %270
  %272 = load i32, i32* @a12, align 4
  %273 = add i32 %271, %272
  store i32 %273, i32* %21, align 4
  %274 = load i32, i32* %10, align 4
  %275 = add i32 1, %274
  %276 = load i32, i32* @a5, align 4
  %277 = add i32 %275, %276
  store i32 %277, i32* %14, align 4
  %278 = load i32, i32* %11, align 4
  %279 = add i32 2, %278
  %280 = load i32, i32* @a6, align 4
  %281 = add i32 %279, %280
  store i32 %281, i32* %15, align 4
  %282 = load i32, i32* %12, align 4
  %283 = add i32 3, %282
  %284 = load i32, i32* @a7, align 4
  %285 = add i32 %283, %284
  store i32 %285, i32* %16, align 4
  %286 = load i32, i32* %13, align 4
  %287 = add i32 4, %286
  %288 = load i32, i32* @a8, align 4
  %289 = add i32 %287, %288
  store i32 %289, i32* %17, align 4
  %290 = load i32, i32* %6, align 4
  %291 = add i32 1, %290
  %292 = load i32, i32* @a1, align 4
  %293 = add i32 %291, %292
  store i32 %293, i32* %10, align 4
  %294 = load i32, i32* %7, align 4
  %295 = add i32 2, %294
  %296 = load i32, i32* @a2, align 4
  %297 = add i32 %295, %296
  store i32 %297, i32* %11, align 4
  %298 = load i32, i32* %8, align 4
  %299 = add i32 3, %298
  %300 = load i32, i32* @a3, align 4
  %301 = add i32 %299, %300
  store i32 %301, i32* %12, align 4
  %302 = load i32, i32* %9, align 4
  %303 = add i32 4, %302
  %304 = load i32, i32* @a4, align 4
  %305 = add i32 %303, %304
  store i32 %305, i32* %13, align 4
  %306 = load i32, i32* %6, align 4
  %307 = add i32 1, %306
  %308 = load i32, i32* @a1, align 4
  %309 = add i32 %307, %308
  store i32 %309, i32* %10, align 4
  %310 = load i32, i32* %7, align 4
  %311 = add i32 2, %310
  %312 = load i32, i32* @a2, align 4
  %313 = add i32 %311, %312
  store i32 %313, i32* %11, align 4
  %314 = load i32, i32* %8, align 4
  %315 = add i32 3, %314
  %316 = load i32, i32* @a3, align 4
  %317 = add i32 %315, %316
  store i32 %317, i32* %12, align 4
  %318 = load i32, i32* %9, align 4
  %319 = add i32 4, %318
  %320 = load i32, i32* @a4, align 4
  %321 = add i32 %319, %320
  store i32 %321, i32* %13, align 4
  %322 = load i32, i32* %2, align 4
  %323 = load i32, i32* %6, align 4
  %324 = add i32 %322, %323
  %325 = load i32, i32* %7, align 4
  %326 = add i32 %324, %325
  %327 = load i32, i32* %8, align 4
  %328 = add i32 %326, %327
  %329 = load i32, i32* %9, align 4
  %330 = add i32 %328, %329
  %331 = load i32, i32* %10, align 4
  %332 = sub i32 %330, %331
  %333 = load i32, i32* %11, align 4
  %334 = sub i32 %332, %333
  %335 = load i32, i32* %12, align 4
  %336 = sub i32 %334, %335
  %337 = load i32, i32* %13, align 4
  %338 = sub i32 %336, %337
  %339 = load i32, i32* %14, align 4
  %340 = add i32 %338, %339
  %341 = load i32, i32* %15, align 4
  %342 = add i32 %340, %341
  %343 = load i32, i32* %16, align 4
  %344 = add i32 %342, %343
  %345 = load i32, i32* %17, align 4
  %346 = add i32 %344, %345
  %347 = load i32, i32* %18, align 4
  %348 = sub i32 %346, %347
  %349 = load i32, i32* %19, align 4
  %350 = sub i32 %348, %349
  %351 = load i32, i32* %20, align 4
  %352 = sub i32 %350, %351
  %353 = load i32, i32* %21, align 4
  %354 = sub i32 %352, %353
  %355 = load i32, i32* %22, align 4
  %356 = add i32 %354, %355
  %357 = load i32, i32* %23, align 4
  %358 = add i32 %356, %357
  %359 = load i32, i32* %24, align 4
  %360 = add i32 %358, %359
  %361 = load i32, i32* %25, align 4
  %362 = add i32 %360, %361
  %363 = load i32, i32* %26, align 4
  %364 = sub i32 %362, %363
  %365 = load i32, i32* %27, align 4
  %366 = sub i32 %364, %365
  %367 = load i32, i32* %28, align 4
  %368 = sub i32 %366, %367
  %369 = load i32, i32* %29, align 4
  %370 = sub i32 %368, %369
  %371 = load i32, i32* %30, align 4
  %372 = add i32 %370, %371
  %373 = load i32, i32* %31, align 4
  %374 = add i32 %372, %373
  %375 = load i32, i32* %32, align 4
  %376 = add i32 %374, %375
  %377 = load i32, i32* %33, align 4
  %378 = add i32 %376, %377
  %379 = load i32, i32* %34, align 4
  %380 = sub i32 %378, %379
  %381 = load i32, i32* %35, align 4
  %382 = sub i32 %380, %381
  %383 = load i32, i32* %36, align 4
  %384 = sub i32 %382, %383
  %385 = load i32, i32* %37, align 4
  %386 = sub i32 %384, %385
  %387 = load i32, i32* %38, align 4
  %388 = add i32 %386, %387
  %389 = load i32, i32* %39, align 4
  %390 = add i32 %388, %389
  %391 = load i32, i32* %40, align 4
  %392 = add i32 %390, %391
  %393 = load i32, i32* %41, align 4
  %394 = add i32 %392, %393
  %395 = load i32, i32* @a1, align 4
  %396 = add i32 %394, %395
  %397 = load i32, i32* @a2, align 4
  %398 = sub i32 %396, %397
  %399 = load i32, i32* @a3, align 4
  %400 = add i32 %398, %399
  %401 = load i32, i32* @a4, align 4
  %402 = sub i32 %400, %401
  %403 = load i32, i32* @a5, align 4
  %404 = add i32 %402, %403
  %405 = load i32, i32* @a6, align 4
  %406 = sub i32 %404, %405
  %407 = load i32, i32* @a7, align 4
  %408 = add i32 %406, %407
  %409 = load i32, i32* @a8, align 4
  %410 = sub i32 %408, %409
  %411 = load i32, i32* @a9, align 4
  %412 = add i32 %410, %411
  %413 = load i32, i32* @a10, align 4
  %414 = sub i32 %412, %413
  %415 = load i32, i32* @a11, align 4
  %416 = add i32 %414, %415
  %417 = load i32, i32* @a12, align 4
  %418 = sub i32 %416, %417
  %419 = load i32, i32* @a13, align 4
  %420 = add i32 %418, %419
  %421 = load i32, i32* @a14, align 4
  %422 = sub i32 %420, %421
  %423 = load i32, i32* @a15, align 4
  %424 = add i32 %422, %423
  %425 = load i32, i32* @a16, align 4
  %426 = sub i32 %424, %425
  %427 = load i32, i32* @a17, align 4
  %428 = add i32 %426, %427
  %429 = load i32, i32* @a18, align 4
  %430 = sub i32 %428, %429
  %431 = load i32, i32* @a19, align 4
  %432 = add i32 %430, %431
  %433 = load i32, i32* @a20, align 4
  %434 = sub i32 %432, %433
  %435 = load i32, i32* @a21, align 4
  %436 = add i32 %434, %435
  %437 = load i32, i32* @a22, align 4
  %438 = sub i32 %436, %437
  %439 = load i32, i32* @a23, align 4
  %440 = add i32 %438, %439
  %441 = load i32, i32* @a24, align 4
  %442 = sub i32 %440, %441
  %443 = load i32, i32* @a25, align 4
  %444 = add i32 %442, %443
  %445 = load i32, i32* @a26, align 4
  %446 = sub i32 %444, %445
  %447 = load i32, i32* @a27, align 4
  %448 = add i32 %446, %447
  %449 = load i32, i32* @a28, align 4
  %450 = sub i32 %448, %449
  %451 = load i32, i32* @a29, align 4
  %452 = add i32 %450, %451
  %453 = load i32, i32* @a30, align 4
  %454 = sub i32 %452, %453
  %455 = load i32, i32* @a31, align 4
  %456 = add i32 %454, %455
  %457 = load i32, i32* @a32, align 4
  %458 = sub i32 %456, %457
  ret i32 %458
}

define i32 @main() {
entry1:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = call i32 @getint()
  store i32 %2, i32* %0, align 4
  %3 = load i32, i32* %0, align 4
  %4 = add i32 %3, 18
  store i32 %4, i32* %1, align 4
  %5 = load i32, i32* %0, align 4
  %6 = load i32, i32* %1, align 4
  %7 = call i32 @func(i32 %5, i32 %6)
  store i32 %7, i32* %0, align 4
  %8 = load i32, i32* %0, align 4
  call void @putint(i32 %8)
  %9 = load i32, i32* %0, align 4
  ret i32 %9
}

