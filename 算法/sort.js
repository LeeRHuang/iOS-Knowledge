let data = [2,6,3,4,8,9]
// let data = [2,3,4,6,8,9]
// let data = [9,8,6,4,3,2]

function bubleSort(data){
	if (!data) {return}
	let length = data.length
	if (!length) {return}

	for (var i = 0; i < length; i++) {
		let flag = false
		console.log(`i ==== : ${i}`)
		for (var j = 0; j < length-i-1; j++) {
			if (data[j] > data[j+1]) {
				let temp = data[j]
				data[j] = data[j+1]
				data[j+1] = temp
				flag = true	
				console.log(`j -------> : ${j}`)
			}
		}
		if (!flag) {
			console.log(`flag is ${flag}`)
			break
		};
	}
	console.log(data)
}

function insertSort(data){
	if (!data) {return}
	let length = data.length
	if (!length) {retur}
	
	for (var i = 1; i < length; i++) {
		console.log(`i is ==== ${i}`)
		let value = data[i]	
		let j = i - 1
		for (; j >= 0; --j) {
			if (data[j] > value) {
				data[j+1] = data[j]
				console.log(`j 等于 ${j}`)
			}else {
				break
			}
		};
		data[j+1] = value
	}
	console.log(data)
}

// bubleSort(data)
insertSort(data)

