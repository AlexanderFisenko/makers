class Video < ActiveRecord::Base
  paginates_per 15
  
  acts_as_votable

  belongs_to :maker

  has_many :comments, as: :commentable

  has_attached_file :video,
    styles: {
      # medium: { geometry: "640x480", format: 'flv' },
      thumb:  { geometry: "100x100#", format: 'jpg', time: 10 }
    },
    processors: [:transcoder]
  do_not_validate_attachment_file_type :video
  # validates_attachment_content_type :video,
  #     content_type: ["video/3gpp"]

  validates_presence_of :title, :video

  scope :by_user_id, -> user_id { where(user_id: user_id) }

end
