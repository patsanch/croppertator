module Paperclip  
  class Croppertator < Thumbnail  
    def transformation_command  
      if crop_and_rotate_command
        puts "CROPPERTATOR: #{crop_and_rotate_command} #{super.join(' ').sub(/ -crop \S+/, '')}"
        "#{crop_and_rotate_command} #{super.join(' ').sub(/ -crop \S+/, '')}"
      else  
        super  
      end  
    end  
  
    def crop_and_rotate_command  
      target = @attachment.instance
      command = ''
      
      if target.cropping?
        command += "-crop #{target.crop_w}x#{target.crop_h}+#{target.crop_x}+#{target.crop_y}"
      end
      
      if target.rotating?
        command += " -rotate #{target.rotation}"
      end
      return command
    end  
  end  
end