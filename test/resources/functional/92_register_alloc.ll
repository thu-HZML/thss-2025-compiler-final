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
  %alloc_36 = alloca i32, align 4
  %alloc_35 = alloca i32, align 4
  %alloc_34 = alloca i32, align 4
  %alloc_33 = alloca i32, align 4
  %alloc_32 = alloca i32, align 4
  %alloc_31 = alloca i32, align 4
  %alloc_30 = alloca i32, align 4
  %alloc_29 = alloca i32, align 4
  %alloc_28 = alloca i32, align 4
  %alloc_27 = alloca i32, align 4
  %alloc_26 = alloca i32, align 4
  %alloc_25 = alloca i32, align 4
  %alloc_24 = alloca i32, align 4
  %alloc_23 = alloca i32, align 4
  %alloc_22 = alloca i32, align 4
  %alloc_21 = alloca i32, align 4
  %alloc_20 = alloca i32, align 4
  %alloc_19 = alloca i32, align 4
  %alloc_18 = alloca i32, align 4
  %alloc_17 = alloca i32, align 4
  %alloc_16 = alloca i32, align 4
  %alloc_15 = alloca i32, align 4
  %alloc_14 = alloca i32, align 4
  %alloc_13 = alloca i32, align 4
  %alloc_12 = alloca i32, align 4
  %alloc_11 = alloca i32, align 4
  %alloc_10 = alloca i32, align 4
  %alloc_9 = alloca i32, align 4
  %alloc_8 = alloca i32, align 4
  %alloc_7 = alloca i32, align 4
  %alloc_6 = alloca i32, align 4
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = load i32, i32* %0, align 4
  %3 = load i32, i32* %1, align 4
  %4 = add i32 %2, %3
  store i32 %4, i32* %alloc_0, align 4
  %5 = call i32 @getint()
  store i32 %5, i32* %alloc_1, align 4
  %6 = call i32 @getint()
  store i32 %6, i32* %alloc_2, align 4
  %7 = call i32 @getint()
  store i32 %7, i32* %alloc_3, align 4
  %8 = call i32 @getint()
  store i32 %8, i32* %alloc_4, align 4
  %9 = load i32, i32* %alloc_1, align 4
  %10 = add i32 1, %9
  %11 = load i32, i32* @a1, align 4
  %12 = add i32 %10, %11
  store i32 %12, i32* %alloc_5, align 4
  %13 = load i32, i32* %alloc_2, align 4
  %14 = add i32 2, %13
  %15 = load i32, i32* @a2, align 4
  %16 = add i32 %14, %15
  store i32 %16, i32* %alloc_6, align 4
  %17 = load i32, i32* %alloc_3, align 4
  %18 = add i32 3, %17
  %19 = load i32, i32* @a3, align 4
  %20 = add i32 %18, %19
  store i32 %20, i32* %alloc_7, align 4
  %21 = load i32, i32* %alloc_4, align 4
  %22 = add i32 4, %21
  %23 = load i32, i32* @a4, align 4
  %24 = add i32 %22, %23
  store i32 %24, i32* %alloc_8, align 4
  %25 = load i32, i32* %alloc_5, align 4
  %26 = add i32 1, %25
  %27 = load i32, i32* @a5, align 4
  %28 = add i32 %26, %27
  store i32 %28, i32* %alloc_9, align 4
  %29 = load i32, i32* %alloc_6, align 4
  %30 = add i32 2, %29
  %31 = load i32, i32* @a6, align 4
  %32 = add i32 %30, %31
  store i32 %32, i32* %alloc_10, align 4
  %33 = load i32, i32* %alloc_7, align 4
  %34 = add i32 3, %33
  %35 = load i32, i32* @a7, align 4
  %36 = add i32 %34, %35
  store i32 %36, i32* %alloc_11, align 4
  %37 = load i32, i32* %alloc_8, align 4
  %38 = add i32 4, %37
  %39 = load i32, i32* @a8, align 4
  %40 = add i32 %38, %39
  store i32 %40, i32* %alloc_12, align 4
  %41 = load i32, i32* %alloc_9, align 4
  %42 = add i32 1, %41
  %43 = load i32, i32* @a9, align 4
  %44 = add i32 %42, %43
  store i32 %44, i32* %alloc_13, align 4
  %45 = load i32, i32* %alloc_10, align 4
  %46 = add i32 2, %45
  %47 = load i32, i32* @a10, align 4
  %48 = add i32 %46, %47
  store i32 %48, i32* %alloc_14, align 4
  %49 = load i32, i32* %alloc_11, align 4
  %50 = add i32 3, %49
  %51 = load i32, i32* @a11, align 4
  %52 = add i32 %50, %51
  store i32 %52, i32* %alloc_15, align 4
  %53 = load i32, i32* %alloc_12, align 4
  %54 = add i32 4, %53
  %55 = load i32, i32* @a12, align 4
  %56 = add i32 %54, %55
  store i32 %56, i32* %alloc_16, align 4
  %57 = load i32, i32* %alloc_13, align 4
  %58 = add i32 1, %57
  %59 = load i32, i32* @a13, align 4
  %60 = add i32 %58, %59
  store i32 %60, i32* %alloc_17, align 4
  %61 = load i32, i32* %alloc_14, align 4
  %62 = add i32 2, %61
  %63 = load i32, i32* @a14, align 4
  %64 = add i32 %62, %63
  store i32 %64, i32* %alloc_18, align 4
  %65 = load i32, i32* %alloc_15, align 4
  %66 = add i32 3, %65
  %67 = load i32, i32* @a15, align 4
  %68 = add i32 %66, %67
  store i32 %68, i32* %alloc_19, align 4
  %69 = load i32, i32* %alloc_16, align 4
  %70 = add i32 4, %69
  %71 = load i32, i32* @a16, align 4
  %72 = add i32 %70, %71
  store i32 %72, i32* %alloc_20, align 4
  %73 = load i32, i32* %alloc_17, align 4
  %74 = add i32 1, %73
  %75 = load i32, i32* @a17, align 4
  %76 = add i32 %74, %75
  store i32 %76, i32* %alloc_21, align 4
  %77 = load i32, i32* %alloc_18, align 4
  %78 = add i32 2, %77
  %79 = load i32, i32* @a18, align 4
  %80 = add i32 %78, %79
  store i32 %80, i32* %alloc_22, align 4
  %81 = load i32, i32* %alloc_19, align 4
  %82 = add i32 3, %81
  %83 = load i32, i32* @a19, align 4
  %84 = add i32 %82, %83
  store i32 %84, i32* %alloc_23, align 4
  %85 = load i32, i32* %alloc_20, align 4
  %86 = add i32 4, %85
  %87 = load i32, i32* @a20, align 4
  %88 = add i32 %86, %87
  store i32 %88, i32* %alloc_24, align 4
  %89 = load i32, i32* %alloc_21, align 4
  %90 = add i32 1, %89
  %91 = load i32, i32* @a21, align 4
  %92 = add i32 %90, %91
  store i32 %92, i32* %alloc_25, align 4
  %93 = load i32, i32* %alloc_22, align 4
  %94 = add i32 2, %93
  %95 = load i32, i32* @a22, align 4
  %96 = add i32 %94, %95
  store i32 %96, i32* %alloc_26, align 4
  %97 = load i32, i32* %alloc_23, align 4
  %98 = add i32 3, %97
  %99 = load i32, i32* @a23, align 4
  %100 = add i32 %98, %99
  store i32 %100, i32* %alloc_27, align 4
  %101 = load i32, i32* %alloc_24, align 4
  %102 = add i32 4, %101
  %103 = load i32, i32* @a24, align 4
  %104 = add i32 %102, %103
  store i32 %104, i32* %alloc_28, align 4
  %105 = load i32, i32* %alloc_25, align 4
  %106 = add i32 1, %105
  %107 = load i32, i32* @a25, align 4
  %108 = add i32 %106, %107
  store i32 %108, i32* %alloc_29, align 4
  %109 = load i32, i32* %alloc_26, align 4
  %110 = add i32 2, %109
  %111 = load i32, i32* @a26, align 4
  %112 = add i32 %110, %111
  store i32 %112, i32* %alloc_30, align 4
  %113 = load i32, i32* %alloc_27, align 4
  %114 = add i32 3, %113
  %115 = load i32, i32* @a27, align 4
  %116 = add i32 %114, %115
  store i32 %116, i32* %alloc_31, align 4
  %117 = load i32, i32* %alloc_28, align 4
  %118 = add i32 4, %117
  %119 = load i32, i32* @a28, align 4
  %120 = add i32 %118, %119
  store i32 %120, i32* %alloc_32, align 4
  %121 = load i32, i32* %alloc_29, align 4
  %122 = add i32 1, %121
  %123 = load i32, i32* @a29, align 4
  %124 = add i32 %122, %123
  store i32 %124, i32* %alloc_33, align 4
  %125 = load i32, i32* %alloc_30, align 4
  %126 = add i32 2, %125
  %127 = load i32, i32* @a30, align 4
  %128 = add i32 %126, %127
  store i32 %128, i32* %alloc_34, align 4
  %129 = load i32, i32* %alloc_31, align 4
  %130 = add i32 3, %129
  %131 = load i32, i32* @a31, align 4
  %132 = add i32 %130, %131
  store i32 %132, i32* %alloc_35, align 4
  %133 = load i32, i32* %alloc_32, align 4
  %134 = add i32 4, %133
  %135 = load i32, i32* @a32, align 4
  %136 = add i32 %134, %135
  store i32 %136, i32* %alloc_36, align 4
  %137 = load i32, i32* %0, align 4
  %138 = load i32, i32* %1, align 4
  %139 = sub i32 %137, %138
  %140 = add i32 %139, 10
  store i32 %140, i32* %alloc_0, align 4
  %141 = load i32, i32* %alloc_29, align 4
  %142 = add i32 1, %141
  %143 = load i32, i32* @a29, align 4
  %144 = add i32 %142, %143
  store i32 %144, i32* %alloc_33, align 4
  %145 = load i32, i32* %alloc_30, align 4
  %146 = add i32 2, %145
  %147 = load i32, i32* @a30, align 4
  %148 = add i32 %146, %147
  store i32 %148, i32* %alloc_34, align 4
  %149 = load i32, i32* %alloc_31, align 4
  %150 = add i32 3, %149
  %151 = load i32, i32* @a31, align 4
  %152 = add i32 %150, %151
  store i32 %152, i32* %alloc_35, align 4
  %153 = load i32, i32* %alloc_32, align 4
  %154 = add i32 4, %153
  %155 = load i32, i32* @a32, align 4
  %156 = add i32 %154, %155
  store i32 %156, i32* %alloc_36, align 4
  %157 = load i32, i32* %alloc_25, align 4
  %158 = add i32 1, %157
  %159 = load i32, i32* @a25, align 4
  %160 = add i32 %158, %159
  store i32 %160, i32* %alloc_29, align 4
  %161 = load i32, i32* %alloc_26, align 4
  %162 = add i32 2, %161
  %163 = load i32, i32* @a26, align 4
  %164 = add i32 %162, %163
  store i32 %164, i32* %alloc_30, align 4
  %165 = load i32, i32* %alloc_27, align 4
  %166 = add i32 3, %165
  %167 = load i32, i32* @a27, align 4
  %168 = add i32 %166, %167
  store i32 %168, i32* %alloc_31, align 4
  %169 = load i32, i32* %alloc_28, align 4
  %170 = add i32 4, %169
  %171 = load i32, i32* @a28, align 4
  %172 = add i32 %170, %171
  store i32 %172, i32* %alloc_32, align 4
  %173 = load i32, i32* %alloc_21, align 4
  %174 = add i32 1, %173
  %175 = load i32, i32* @a21, align 4
  %176 = add i32 %174, %175
  store i32 %176, i32* %alloc_25, align 4
  %177 = load i32, i32* %alloc_22, align 4
  %178 = add i32 2, %177
  %179 = load i32, i32* @a22, align 4
  %180 = add i32 %178, %179
  store i32 %180, i32* %alloc_26, align 4
  %181 = load i32, i32* %alloc_23, align 4
  %182 = add i32 3, %181
  %183 = load i32, i32* @a23, align 4
  %184 = add i32 %182, %183
  store i32 %184, i32* %alloc_27, align 4
  %185 = load i32, i32* %alloc_24, align 4
  %186 = add i32 4, %185
  %187 = load i32, i32* @a24, align 4
  %188 = add i32 %186, %187
  store i32 %188, i32* %alloc_28, align 4
  %189 = load i32, i32* %alloc_17, align 4
  %190 = add i32 1, %189
  %191 = load i32, i32* @a17, align 4
  %192 = add i32 %190, %191
  store i32 %192, i32* %alloc_21, align 4
  %193 = load i32, i32* %alloc_18, align 4
  %194 = add i32 2, %193
  %195 = load i32, i32* @a18, align 4
  %196 = add i32 %194, %195
  store i32 %196, i32* %alloc_22, align 4
  %197 = load i32, i32* %alloc_19, align 4
  %198 = add i32 3, %197
  %199 = load i32, i32* @a19, align 4
  %200 = add i32 %198, %199
  store i32 %200, i32* %alloc_23, align 4
  %201 = load i32, i32* %alloc_20, align 4
  %202 = add i32 4, %201
  %203 = load i32, i32* @a20, align 4
  %204 = add i32 %202, %203
  store i32 %204, i32* %alloc_24, align 4
  %205 = load i32, i32* %alloc_13, align 4
  %206 = add i32 1, %205
  %207 = load i32, i32* @a13, align 4
  %208 = add i32 %206, %207
  store i32 %208, i32* %alloc_17, align 4
  %209 = load i32, i32* %alloc_14, align 4
  %210 = add i32 2, %209
  %211 = load i32, i32* @a14, align 4
  %212 = add i32 %210, %211
  store i32 %212, i32* %alloc_18, align 4
  %213 = load i32, i32* %alloc_15, align 4
  %214 = add i32 3, %213
  %215 = load i32, i32* @a15, align 4
  %216 = add i32 %214, %215
  store i32 %216, i32* %alloc_19, align 4
  %217 = load i32, i32* %alloc_16, align 4
  %218 = add i32 4, %217
  %219 = load i32, i32* @a16, align 4
  %220 = add i32 %218, %219
  store i32 %220, i32* %alloc_20, align 4
  %221 = load i32, i32* %alloc_9, align 4
  %222 = add i32 1, %221
  %223 = load i32, i32* @a9, align 4
  %224 = add i32 %222, %223
  store i32 %224, i32* %alloc_13, align 4
  %225 = load i32, i32* %alloc_10, align 4
  %226 = add i32 2, %225
  %227 = load i32, i32* @a10, align 4
  %228 = add i32 %226, %227
  store i32 %228, i32* %alloc_14, align 4
  %229 = load i32, i32* %alloc_11, align 4
  %230 = add i32 3, %229
  %231 = load i32, i32* @a11, align 4
  %232 = add i32 %230, %231
  store i32 %232, i32* %alloc_15, align 4
  %233 = load i32, i32* %alloc_12, align 4
  %234 = add i32 4, %233
  %235 = load i32, i32* @a12, align 4
  %236 = add i32 %234, %235
  store i32 %236, i32* %alloc_16, align 4
  %237 = load i32, i32* %alloc_5, align 4
  %238 = add i32 1, %237
  %239 = load i32, i32* @a5, align 4
  %240 = add i32 %238, %239
  store i32 %240, i32* %alloc_9, align 4
  %241 = load i32, i32* %alloc_6, align 4
  %242 = add i32 2, %241
  %243 = load i32, i32* @a6, align 4
  %244 = add i32 %242, %243
  store i32 %244, i32* %alloc_10, align 4
  %245 = load i32, i32* %alloc_7, align 4
  %246 = add i32 3, %245
  %247 = load i32, i32* @a7, align 4
  %248 = add i32 %246, %247
  store i32 %248, i32* %alloc_11, align 4
  %249 = load i32, i32* %alloc_8, align 4
  %250 = add i32 4, %249
  %251 = load i32, i32* @a8, align 4
  %252 = add i32 %250, %251
  store i32 %252, i32* %alloc_12, align 4
  %253 = load i32, i32* %alloc_1, align 4
  %254 = add i32 1, %253
  %255 = load i32, i32* @a1, align 4
  %256 = add i32 %254, %255
  store i32 %256, i32* %alloc_5, align 4
  %257 = load i32, i32* %alloc_2, align 4
  %258 = add i32 2, %257
  %259 = load i32, i32* @a2, align 4
  %260 = add i32 %258, %259
  store i32 %260, i32* %alloc_6, align 4
  %261 = load i32, i32* %alloc_3, align 4
  %262 = add i32 3, %261
  %263 = load i32, i32* @a3, align 4
  %264 = add i32 %262, %263
  store i32 %264, i32* %alloc_7, align 4
  %265 = load i32, i32* %alloc_4, align 4
  %266 = add i32 4, %265
  %267 = load i32, i32* @a4, align 4
  %268 = add i32 %266, %267
  store i32 %268, i32* %alloc_8, align 4
  %269 = load i32, i32* %alloc_1, align 4
  %270 = add i32 1, %269
  %271 = load i32, i32* @a1, align 4
  %272 = add i32 %270, %271
  store i32 %272, i32* %alloc_5, align 4
  %273 = load i32, i32* %alloc_2, align 4
  %274 = add i32 2, %273
  %275 = load i32, i32* @a2, align 4
  %276 = add i32 %274, %275
  store i32 %276, i32* %alloc_6, align 4
  %277 = load i32, i32* %alloc_3, align 4
  %278 = add i32 3, %277
  %279 = load i32, i32* @a3, align 4
  %280 = add i32 %278, %279
  store i32 %280, i32* %alloc_7, align 4
  %281 = load i32, i32* %alloc_4, align 4
  %282 = add i32 4, %281
  %283 = load i32, i32* @a4, align 4
  %284 = add i32 %282, %283
  store i32 %284, i32* %alloc_8, align 4
  %285 = load i32, i32* %alloc_0, align 4
  %286 = load i32, i32* %alloc_1, align 4
  %287 = add i32 %285, %286
  %288 = load i32, i32* %alloc_2, align 4
  %289 = add i32 %287, %288
  %290 = load i32, i32* %alloc_3, align 4
  %291 = add i32 %289, %290
  %292 = load i32, i32* %alloc_4, align 4
  %293 = add i32 %291, %292
  %294 = load i32, i32* %alloc_5, align 4
  %295 = sub i32 %293, %294
  %296 = load i32, i32* %alloc_6, align 4
  %297 = sub i32 %295, %296
  %298 = load i32, i32* %alloc_7, align 4
  %299 = sub i32 %297, %298
  %300 = load i32, i32* %alloc_8, align 4
  %301 = sub i32 %299, %300
  %302 = load i32, i32* %alloc_9, align 4
  %303 = add i32 %301, %302
  %304 = load i32, i32* %alloc_10, align 4
  %305 = add i32 %303, %304
  %306 = load i32, i32* %alloc_11, align 4
  %307 = add i32 %305, %306
  %308 = load i32, i32* %alloc_12, align 4
  %309 = add i32 %307, %308
  %310 = load i32, i32* %alloc_13, align 4
  %311 = sub i32 %309, %310
  %312 = load i32, i32* %alloc_14, align 4
  %313 = sub i32 %311, %312
  %314 = load i32, i32* %alloc_15, align 4
  %315 = sub i32 %313, %314
  %316 = load i32, i32* %alloc_16, align 4
  %317 = sub i32 %315, %316
  %318 = load i32, i32* %alloc_17, align 4
  %319 = add i32 %317, %318
  %320 = load i32, i32* %alloc_18, align 4
  %321 = add i32 %319, %320
  %322 = load i32, i32* %alloc_19, align 4
  %323 = add i32 %321, %322
  %324 = load i32, i32* %alloc_20, align 4
  %325 = add i32 %323, %324
  %326 = load i32, i32* %alloc_21, align 4
  %327 = sub i32 %325, %326
  %328 = load i32, i32* %alloc_22, align 4
  %329 = sub i32 %327, %328
  %330 = load i32, i32* %alloc_23, align 4
  %331 = sub i32 %329, %330
  %332 = load i32, i32* %alloc_24, align 4
  %333 = sub i32 %331, %332
  %334 = load i32, i32* %alloc_25, align 4
  %335 = add i32 %333, %334
  %336 = load i32, i32* %alloc_26, align 4
  %337 = add i32 %335, %336
  %338 = load i32, i32* %alloc_27, align 4
  %339 = add i32 %337, %338
  %340 = load i32, i32* %alloc_28, align 4
  %341 = add i32 %339, %340
  %342 = load i32, i32* %alloc_29, align 4
  %343 = sub i32 %341, %342
  %344 = load i32, i32* %alloc_30, align 4
  %345 = sub i32 %343, %344
  %346 = load i32, i32* %alloc_31, align 4
  %347 = sub i32 %345, %346
  %348 = load i32, i32* %alloc_32, align 4
  %349 = sub i32 %347, %348
  %350 = load i32, i32* %alloc_33, align 4
  %351 = add i32 %349, %350
  %352 = load i32, i32* %alloc_34, align 4
  %353 = add i32 %351, %352
  %354 = load i32, i32* %alloc_35, align 4
  %355 = add i32 %353, %354
  %356 = load i32, i32* %alloc_36, align 4
  %357 = add i32 %355, %356
  %358 = load i32, i32* @a1, align 4
  %359 = add i32 %357, %358
  %360 = load i32, i32* @a2, align 4
  %361 = sub i32 %359, %360
  %362 = load i32, i32* @a3, align 4
  %363 = add i32 %361, %362
  %364 = load i32, i32* @a4, align 4
  %365 = sub i32 %363, %364
  %366 = load i32, i32* @a5, align 4
  %367 = add i32 %365, %366
  %368 = load i32, i32* @a6, align 4
  %369 = sub i32 %367, %368
  %370 = load i32, i32* @a7, align 4
  %371 = add i32 %369, %370
  %372 = load i32, i32* @a8, align 4
  %373 = sub i32 %371, %372
  %374 = load i32, i32* @a9, align 4
  %375 = add i32 %373, %374
  %376 = load i32, i32* @a10, align 4
  %377 = sub i32 %375, %376
  %378 = load i32, i32* @a11, align 4
  %379 = add i32 %377, %378
  %380 = load i32, i32* @a12, align 4
  %381 = sub i32 %379, %380
  %382 = load i32, i32* @a13, align 4
  %383 = add i32 %381, %382
  %384 = load i32, i32* @a14, align 4
  %385 = sub i32 %383, %384
  %386 = load i32, i32* @a15, align 4
  %387 = add i32 %385, %386
  %388 = load i32, i32* @a16, align 4
  %389 = sub i32 %387, %388
  %390 = load i32, i32* @a17, align 4
  %391 = add i32 %389, %390
  %392 = load i32, i32* @a18, align 4
  %393 = sub i32 %391, %392
  %394 = load i32, i32* @a19, align 4
  %395 = add i32 %393, %394
  %396 = load i32, i32* @a20, align 4
  %397 = sub i32 %395, %396
  %398 = load i32, i32* @a21, align 4
  %399 = add i32 %397, %398
  %400 = load i32, i32* @a22, align 4
  %401 = sub i32 %399, %400
  %402 = load i32, i32* @a23, align 4
  %403 = add i32 %401, %402
  %404 = load i32, i32* @a24, align 4
  %405 = sub i32 %403, %404
  %406 = load i32, i32* @a25, align 4
  %407 = add i32 %405, %406
  %408 = load i32, i32* @a26, align 4
  %409 = sub i32 %407, %408
  %410 = load i32, i32* @a27, align 4
  %411 = add i32 %409, %410
  %412 = load i32, i32* @a28, align 4
  %413 = sub i32 %411, %412
  %414 = load i32, i32* @a29, align 4
  %415 = add i32 %413, %414
  %416 = load i32, i32* @a30, align 4
  %417 = sub i32 %415, %416
  %418 = load i32, i32* @a31, align 4
  %419 = add i32 %417, %418
  %420 = load i32, i32* @a32, align 4
  %421 = sub i32 %419, %420
  ret i32 %421
}

define i32 @main() {
entry1:
  %alloc_38 = alloca i32, align 4
  %alloc_37 = alloca i32, align 4
  %0 = call i32 @getint()
  store i32 %0, i32* %alloc_37, align 4
  %1 = load i32, i32* %alloc_37, align 4
  %2 = add i32 %1, 18
  store i32 %2, i32* %alloc_38, align 4
  %3 = load i32, i32* %alloc_37, align 4
  %4 = load i32, i32* %alloc_38, align 4
  %5 = call i32 @func(i32 %3, i32 %4)
  store i32 %5, i32* %alloc_37, align 4
  %6 = load i32, i32* %alloc_37, align 4
  call void @putint(i32 %6)
  %7 = load i32, i32* %alloc_37, align 4
  ret i32 %7
}

