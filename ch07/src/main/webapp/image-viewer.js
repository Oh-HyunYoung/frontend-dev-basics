$(function() {
	// 한 번 클릭 시 이미지 변경
	$("#btn-change").click(function _changeImage() {
		var index = Math.floor(Math.random() * imageViewer._images.length);
		var info = imageViewer._images[index];
		console.log(info.name);
		$("img").attr("src", imageViewer._images[index].file);
	});

	// 슬라이드쇼 실행&중지
	$("#btn-slideshow").click(function _slideshow() {
		var count = setInterval(function(){
		var index = Math.floor(Math.random() * imageViewer._images.length);
		$("img").attr("src", imageViewer._images[index].file);
		},1000);
		
		$("#btn-slideshow").replaceWith("<button id='btn-slideshowstop'>슬라이드쇼 중지</button>");
		$("#btn-slideshowstop").click(function(){
			clearInterval(count);
		})	
	});
	
	imageViewer = {
		_intevalId: null,
		_images: [{
			name: '국화',
			file: 'images/Chrysanthemum.jpg'
		}, {
			name: '사막',
			file: 'images/Desert.jpg'
		}, {
			name: '수국',
			file: 'images/Hydrangeas.jpg'
		}, {
			name: '해파리',
			file: 'images/Jellyfish.jpg'
		}, {
			name: '코알라',
			file: 'images/Koala.jpg'
		}, {
			name: '등대',
			file: 'images/Lighthouse.jpg'
		}, {
			name: '펭귄',
			file: 'images/Penguins.jpg'
		}, {
			name: '튤립',
			file: 'images/Tulips.jpg'
		}]

	}
});
